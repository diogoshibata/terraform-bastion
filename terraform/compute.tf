//Temporary key for remote-exec resource
resource "tls_private_key" "public_private_key_pair" {
  algorithm   = "RSA"
}

resource "oci_core_instance" "bastion" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.availability_domains.availability_domains[var.availability_domains -2],"name")}"
  compartment_id = "${oci_identity_compartment.oke_compartment.id}"
  display_name = "vm-bastion"
  shape = "${var.instance_shape}"
  subnet_id = "${oci_core_subnet.sub01.id}"

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key_pub}\n${tls_private_key.public_private_key_pair.public_key_openssh}" //The second key is a temporary one for the "remote-exec" resource
/*    user_data = "${base64encode(file(var.bootstrap_file))}"   //The commands were placed at a remote-exec resource instead
    assign_public_ip = "false"  */
  }

  source_details {
    source_type = "image"
    source_id = "${var.instance_image_ocid[var.region]}"
  }
}

//The next block is made just for this Workshop and does not correspond to a security best practice
resource "null_resource" "remote-exec" {
  depends_on = ["oci_core_instance.bastion"]

    connection {
      agent = false
      timeout = "30m"
      host = "${oci_core_instance.bastion.public_ip}"
      user = "opc"
      private_key = "${tls_private_key.public_private_key_pair.private_key_pem}"
    }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install python-oci-cli kubectl git -y",
      "sudo systemctl enable ocid.service",
      "sudo systemctl start ocid.service",
      "sudo systemctl status ocid.service",
      //Creation of default directory for OCI CLI configuration and files
      "mkdir -p ~/.oci/",
      //Create the default configuration file
      "touch ~/.oci/config",
      //Insert the Workshop default information
      "echo [DEFAULT] >> ~/.oci/config",
      "echo user=${var.user_id} >> ~/.oci/config", //It's not a best practice to have de User OCID as a variable - Workshop use only
      "echo fingerprint=2d:b9:0f:d1:0d:07:1c:a7:d2:ad:47:8e:fc:7c:18:80 >> ~/.oci/config", //Figerprint for Workshop Public PEM Key - Workshop use only
      "echo key_file=~/.oci/oci_api_key.pem >> ~/.oci/config",
      "echo tenancy=${var.tenancy_ocid} >> ~/.oci/config",
      "echo region=${var.region} >> ~/.oci/config",
      "echo compartment=${var.compartment_ocid} >> ~/.oci/config",
      "oci setup repair-file-permissions --file ~/.oci/config"
    ]
  }

  provisioner "file" {  //It's not a best practice to use Private Keys with the Terraform files - Workshop use only
    source = "./ssh-keys/oci_api_key.pem"
    destination = "~/.oci/oci_api_key.pem"
  }
/*
  provisioner "remote-exec" {
    inline = [
      "oci iam auth-token create --description 'OKE Auth Token' --user-id '${var.user_id}'" //It's not a best practice to show and save the Auth Token in a log file - Workshop use only
    ]
  }*/
}
