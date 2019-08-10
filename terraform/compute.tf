resource "oci_core_instance" "bastion" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.availability_domains.availability_domains[var.availability_domains -2],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "vm-bastion"
  shape = "${var.instance_shape}"
  subnet_id = "${oci_core_subnet.sub01.id}"

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.bootstrap_file))}"
#    assign_public_ip = "false"
  }

  source_details {
    source_type = "image"
    source_id = "${var.instance_image_ocid[var.region]}"
  }
}
