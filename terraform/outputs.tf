
output "bastion_id" {
  value = ["${oci_core_instance.bastion.id}"]
}

output "bastion_ip" {
  value = ["${oci_core_instance.bastion.public_ip}"]
}