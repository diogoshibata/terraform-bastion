output "DOCKER_USERNAME" {
  value = "${data.oci_objectstorage_namespace.storage_namespace.namespace}/${data.oci_identity_user.oke_user.name}"
}

output "OCI_AUTH_TOKEN" { //It's not a best practice to show or save the Auth Token in a log/output file - Workshop use only
  value = "${oci_identity_auth_token.oke_auth_token.token}"
}

output "DOCKER_REPO" {
  value = "${data.oci_objectstorage_namespace.storage_namespace.namespace}/twitter-feed"
}
