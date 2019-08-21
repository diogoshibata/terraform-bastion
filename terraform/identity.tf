resource "oci_identity_policy" "allow_oke_policy" {
    compartment_id = "${var.tenancy_ocid}"
    description = "Workshop Policy"
    name = "oke-policy"
    statements = "${var.oke_policy}"
}

resource "oci_identity_compartment" "oke_compartment" {
    compartment_id = "${var.tenancy_ocid}"
    description = "Workshop Compartment"
    name = "OKE-Workshop"
}

#Public PEM Key used for Workshop
resource "oci_identity_api_key" "oci_api_key_public" {
    //key_value = "${file(./ssh-keys/oci_api_key_public.pem)}"
    user_id = "${var.user_id}"
    key_value = "${file(var.ssh_public_key_pem_path)}"
}

#Auth Token created for Workshop only
resource "oci_identity_auth_token" "oke_auth_token" {
  description = "OKE Workshop Auth Token"
  user_id     = "${var.user_id}"
}

#Get Object Storage Namespace needed to use Oracle Cloud Infrastructure Registry (OCIR)
data "oci_objectstorage_namespace" "storage_namespace" {
  #Optional
  compartment_id = "${var.tenancy_ocid}"
}

#Get the username to login on Oracle Cloud Infrastructure Registry (OCIR)
data "oci_identity_user" "oke_user" {
    user_id = "${var.user_id}"
}
