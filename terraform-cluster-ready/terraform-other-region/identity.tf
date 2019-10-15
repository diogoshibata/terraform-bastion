resource "oci_identity_compartment" "oke_compartment" {
    compartment_id = "${var.tenancy_ocid}"
    description = "Workshop Compartment"
    name = "OKE-Workshop"
}
