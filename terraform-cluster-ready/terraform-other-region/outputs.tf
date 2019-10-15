output "Bastion Host IP" {
  value = "${oci_core_instance.bastion.public_ip}"
}
