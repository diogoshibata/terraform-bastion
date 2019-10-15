variable "tenancy_ocid" {}

#It's not a best practice to have de User OCID as a variable - Workshop use only
variable "user_id" {
  description = "Your User OCID"
}

variable "ssh_public_key_pem_path" {
  description = "Public PEM Key path to use for user login in tenancy"
  default = "./ssh-keys/oci_api_key_public.pem"
}

variable "oke_policy" {
  description = "The policy that allows OKE to manage resources in the environment"
  type = "list"
  default = ["allow service OKE to manage all-resources in tenancy"]
}
