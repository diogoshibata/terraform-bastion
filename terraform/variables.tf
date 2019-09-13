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
  description = "Addresses to map Oracle Linux Image 7.x"
  type = "map"
  default = {
    // Oracle-provided image "Oracle-Linux-7.x"
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // https://docs.cloud.oracle.com/iaas/images/image/7d31cb1d-f31f-450c-95c4-0539776c3dcf/
    ap-mumbai-1="ocid1.image.oc1.ap-mumbai-1.aaaaaaaanqnm77gq2dpmc2aih2ddlwlahuv2qwmokufb7zbi52v67pzkzycq"
    ap-seoul-1="ocid1.image.oc1.ap-seoul-1.aaaaaaaav3lc5w7cvz5yr6hpjdubxupjeduzd5xvaroyhjg6vwqzsdvgus6q"
    ap-sydney-1="ocid1.image.oc1.ap-sydney-1.aaaaaaaagtfumjxhosxrkgfci3dgwvsmp35ip5nbhy2rypxfh3rwtqsozkcq"
    ap-tokyo-1="ocid1.image.oc1.ap-tokyo-1.aaaaaaaajousbvplzyrh727e3d4sb6bam5d2fomwhbtzatoun5sqcuvvfjnq"
    ca-toronto-1="ocid1.image.oc1.ca-toronto-1.aaaaaaaavr35ze44lkflxffkhmt4xyamkfjpbjhsm5awxjwlnp3gpx7h7fgq"
    eu-frankfurt-1="ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7gj6uot6tz6t34qjzvkldxtwse7gr5m7xvnh6xfm53ddxp3w37ja"
    eu-zurich-1="ocid1.image.oc1.eu-zurich-1.aaaaaaaasl3mlhvgzhfglqqkwdbppmmgomkz6iyi42wjkceldqcpecg7jzgq"
    sa-saopaulo-1="ocid1.image.oc1.sa-saopaulo-1.aaaaaaaawamujpmwxbjgrfeb66zpew5sgz4bimzb4wgcwhqdjyct53bucvoq"
    uk-london-1="ocid1.image.oc1.uk-london-1.aaaaaaaa6trfxqtp5ib7yfgj725js3o6agntmv6vckarebsmacrhdxqojeya"
    us-ashburn-1="ocid1.image.oc1.iad.aaaaaaaayuihpsm2nfkxztdkottbjtfjqhgod7hfuirt2rqlewxrmdlgg75q"
    us-langley-1="ocid1.image.oc2.us-langley-1.aaaaaaaaazlspcasnl4ibjwu7g5ukiaqjp6xcbk5lqgtdsazd7v6evbkwxcq"
    us-luke-1="ocid1.image.oc2.us-luke-1.aaaaaaaa73qnm5jktrwmkutf6iaigib4msieymk2s5r5iweq5yvqublgcx5q"
    us-phoenix-1="ocid1.image.oc1.phx.aaaaaaaadtmpmfm77czi5ghi5zh7uvkguu6dsecsg7kuo3eigc5663und4za"
  }
}

variable "instance_shape" {
  description = "The shape of the Bastion Host compute instance"
  default = "VM.Standard2.2"
}

variable "availability_domains" {
  default = "3"
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

variable "oke_policy" {
  description = "The policy that allows OKE to manage resources in the environment"
  type = "list"
  default = ["allow service OKE to manage all-resources in tenancy"]
}
