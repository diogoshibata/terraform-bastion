resource "oci_containerengine_cluster" "oke_cluster" {
    depends_on = ["oci_identity_policy.allow_oke_policy"]
    
    compartment_id = "${oci_identity_compartment.oke_compartment.id}"
    kubernetes_version = "1.13.5"
    name = "cluster-workshop"
    vcn_id = "${oci_core_vcn.vcn-workshop.id}"
}