variable "region" {}

variable "tenancy_ocid" {}

variable "compartment_ocid" {}

#It's not a best practice to have de User OCID as a variable - Workshop use only
variable "user_id" {
  description = "Your User OCID"
}

/*
#The commands were placed at a remote-exec resource instead
variable "bootstrap_file" {
  description = "Bootstrap to run on instance after provisioning"
  default = "./userdata/bootstrap"
}
*/

variable "instance_image_ocid" {
  description = "Addresses to map Oracle Linux Image 7.7"
  type = "map"
  default = {
    // Oracle-provided image "Oracle-Linux-7.7"
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // https://docs.cloud.oracle.com/iaas/images/image/554b84a7-9b76-424d-89ef-15ea591c5eef/
    ap-mumbai-1="ocid1.image.oc1.ap-mumbai-1.aaaaaaaaefcax7pqzhgcpiaxomtzvwj67cssuxhazggbhoxjv4adcvsfkfga"
    ap-seoul-1="ocid1.image.oc1.ap-seoul-1.aaaaaaaaxabo4p5asejscj4ba4weg62owtivojokmtcjyr6eqrdeq4dgfzvq"
    ap-sydney-1="ocid1.image.oc1.ap-sydney-1.aaaaaaaahggevnzn2hs3abhwacvv5jxnguoxdej3bnuy5t4cy3jrslubgqoa"
    ap-tokyo-1="ocid1.image.oc1.ap-tokyo-1.aaaaaaaatbwoj3ee5sbaa6u5ptpy74bukkqmj75bptvn7dpezovpdvr6ds2q"
    ca-toronto-1="ocid1.image.oc1.ca-toronto-1.aaaaaaaanljihk7bncal55wmgk5yrt23kpongv733zx5w5k4h46qs4srgqua"
    eu-frankfurt-1="ocid1.image.oc1.eu-frankfurt-1.aaaaaaaajqghpxnszpnghz3um66jywaw5q3pudfw5qwwkyu24ef7lcsyjhsq"
    eu-zurich-1="ocid1.image.oc1.eu-zurich-1.aaaaaaaakla6mguktwqu7hmv75p7haiharf4usbpvjeogl7pnk3tbyqmawbq"
    sa-saopaulo-1="ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaj6eqq3vky7mwktyewgylrvn7dhaqno6ypd6lt3yj7qigrfe7a4ca"
    uk-london-1="ocid1.image.oc1.uk-london-1.aaaaaaaaf4nj5yoqo7gv6ht6t7gtcr5de5slhy52alv3nqyjvmmh25knbama"
    us-ashburn-1="ocid1.image.oc1.iad.aaaaaaaa3onyerinivkpiqektrd3idoeo72fuz56cpz6rihkvqulmoux5qkq"
    us-langley-1="ocid1.image.oc2.us-langley-1.aaaaaaaawq36twtmxcxklpcqczltp7ckuy3aj7e6wkfkweq4xacfdelytgfa"
    us-luke-1="ocid1.image.oc2.us-luke-1.aaaaaaaabrxehwss7yrocavvaa5qcximxr2vkyrsuloq5ctnzxdhcvmdo2ga"
    us-phoenix-1="ocid1.image.oc1.phx.aaaaaaaalza4xew5okvv42djc3bphidkf7pa7xy435uieguz4aau735flbmq"
  }
}

variable "instance_shape" {
  description = "The shape of the Bastion Host compute instance"
  default = "VM.Standard2.2"
}

variable "availability_domains" {
  default = "1"
}

variable "vcn_cidr" {
  description = "Virtual Cloud Network (VLAN): 192.168.0.0 - 192.168.255.255"
  default = "192.168.0.0/16"
}

variable "sub_01" {
  description = "Subnet for our Bastion Host: 192.168.1.0 - 192.168.1.255"
  default = "192.168.1.0/24"
}

variable "ssh_public_key_pub" {
  description = "Public PUB Key to use in Bastion Host compute instance"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHX7WQWmFGqyO8RLktNUFfaAnyP1+Nlf7wAeclf6m+3H7JHygpGLIuuQw7GXMHH86/IwkxbO62TcLPTr99wO/h8WnreiILWr+v5vmoMKq0BcSPt57Qclpdq2KbhivYaBfoM4TK1tyMSsqnXbmtlhBbdPpz6MXkSLhsiZHKaxT1435ZwW5l4poC481d1/XI7iikEno7rvvTRyL4vC7xoqkWeNexEVb2uDD4zkYxgoobMjFdk9M4TDSxbkoTMb9SbLbR+980Dte2ccgaduN7JsZWIqjDMlkjDOqnN4NxR5zpGaOVnqDD7F6naB4N26SCC8pbl9X2SL5/VDaqYuCTCO8j imported-openssh-key"
}

variable "ssh_public_key_pem_path" {
  description = "Public PEM Key path to use for user login in tenancy"
  default = "./ssh-keys/oci_api_key_public.pem"
}

variable "oke_compartment_id" {
  description = "Paste your OKE-Workshop Compartment OCID"
}

variable "oke_cluster_ocid" {
  description = "Paste your OKE Cluster OCID"
}
