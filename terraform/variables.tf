variable "region" {}

variable "compartment_ocid" {}

variable "bootstrap_file" {
  default = "./userdata/bootstrap"
}

variable "instance_image_ocid" {
  type = "map"
  default = {
    // Oracle-provided image "Oracle-Linux-7.x"
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // https://docs.cloud.oracle.com/iaas/images/image/7d31cb1d-f31f-450c-95c4-0539776c3dcf/
    ap-mumbai-1="ocid1.image.oc1.ap-mumbai-1.aaaaaaaajc74fbcjvb6fm55ij6pfi6fgp6t4r4axfwbh3hkb6fjwpvt64xta"
    ap-seoul-1="ocid1.image.oc1.ap-seoul-1.aaaaaaaacdrxj4ktv6qilozzc7bkhcrdlzri2gw4imlljpg255stxvkbgpnq"
    ap-tokyo-1="ocid1.image.oc1.ap-tokyo-1.aaaaaaaasd7bfo4bykdf3jlb7n5j46oeqxwj2r3ub4ly36db3pmrlmlzzv3a"
    ca-toronto-1="ocid1.image.oc1.ca-toronto-1.aaaaaaaa3i4wzxnwlfgizjv4usrz2fh7dhgolp5dmrmmqcm4i7bdhkbdracq"
    eu-frankfurt-1="ocid1.image.oc1.eu-frankfurt-1.aaaaaaaax3xjmpwufw6tucuoyuenletg74sdsj5f2gzsvlv4mqbbgeokqzsq"
    uk-london-1="ocid1.image.oc1.uk-london-1.aaaaaaaaokbcnsqwbrgz2wiif2s452u2a4o674tnjsamja5rhtpml5a7sana"
    us-ashburn-1="ocid1.image.oc1.iad.aaaaaaaasorq3smbazoxvyqozz52ch5i5cexjojb7qvcefa5ubij2yjycy2a"
    us-langley-1="ocid1.image.oc2.us-langley-1.aaaaaaaad225yfhwxrkt4aprxf6erfhtiubrrq3ythktnuv4vu5lzgqowgsa"
    us-luke-1="ocid1.image.oc2.us-luke-1.aaaaaaaat37ujafbrdcdfirlfhwzsozyp4lnvzbv2ubiy2p6ob6q3lekpgjq"
    us-phoenix-1="ocid1.image.oc1.phx.aaaaaaaaa3vjdblyvw6rlz3jhjxudf6dpqsazqfynn3ziqrxyfox2wq5bdaq"
  }
}

variable "instance_shape" {
  description = "The shape of the compute instance"
  default = "VM.Standard2.2"
}

variable "availability_domains" {
  default = "3"
}

variable "vcn_cidr" {
  default = "192.168.0.0/16"
}

variable "sub_01" {
  default = "192.168.1.0/24"
}

variable ssh_public_key {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHX7WQWmFGqyO8RLktNUFfaAnyP1+Nlf7wAeclf6m+3H7JHygpGLIuuQw7GXMHH86/IwkxbO62TcLPTr99wO/h8WnreiILWr+v5vmoMKq0BcSPt57Qclpdq2KbhivYaBfoM4TK1tyMSsqnXbmtlhBbdPpz6MXkSLhsiZHKaxT1435ZwW5l4poC481d1/XI7iikEno7rvvTRyL4vC7xoqkWeNexEVb2uDD4zkYxgoobMjFdk9M4TDSxbkoTMb9SbLbR+980Dte2ccgaduN7JsZWIqjDMlkjDOqnN4NxR5zpGaOVnqDD7F6naB4N26SCC8pbl9X2SL5/VDaqYuCTCO8j imported-openssh-key"
}