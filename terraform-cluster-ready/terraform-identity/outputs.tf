output "User Auth Token" { //It's not a best practice to show or save the Auth Token in a log/output file - Workshop use only
  value = "${oci_identity_auth_token.oke_auth_token.token}"
}

output "Object Storage Namespace" {
  value = "${data.oci_objectstorage_namespace.storage_namespace.namespace}"
}

output "Username for Registry login" {
  value = "${data.oci_identity_user.oke_user.name}"
}
