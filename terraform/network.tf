<<<<<<< HEAD
/* Network */
data "oci_identity_availability_domains" "availability_domains" {
  compartment_id = "${oci_identity_compartment.oke_compartment.id}"
}

############################################
# Local variables
############################################

locals {
  tcp_protocol = "6"
  all_protocol = "all"
  anywhere = "0.0.0.0/0"
}

############################################
# Create VCN
############################################

resource "oci_core_vcn" "vcn-workshop" {
  display_name = "vcn-workshop"
  cidr_block = "${var.vcn_cidr}"
  compartment_id = "${oci_identity_compartment.oke_compartment.id}"
  dns_label = "vcnworkshop"
}

############################################
# Create Internet Gateway
############################################

resource "oci_core_internet_gateway" "ig-workshop" {
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"
}

############################################
# Create Route Table
############################################

resource "oci_core_route_table" "routetable" {
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"
  display_name = "Bastion Route Table"

  route_rules {
    destination = "${local.anywhere}"
//    destination_type = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.ig-workshop.id}"
  }
}

############################################
# Create Security List
############################################

resource "oci_core_security_list" "securitylist" {
  display_name = "Bastion Security List"
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"

  egress_security_rules = [
    {
      protocol = "${local.all_protocol}"
      destination = "${local.anywhere}"
    }
  ]

  ingress_security_rules = [
    {
      protocol = "${local.tcp_protocol}"
      source = "${local.anywhere}"

      tcp_options {
        "min" = 22
        "max" = 22
      }
    }
  ]
}


############################################
# Create Subnet
############################################
resource "oci_core_subnet" "sub01" {
  display_name = "sub01"
  cidr_block = "${var.sub_01}"
  dns_label = "sub01"
  security_list_ids = ["${oci_core_security_list.securitylist.id}"]
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"
  route_table_id = "${oci_core_route_table.routetable.id}"
  dhcp_options_id = "${oci_core_vcn.vcn-workshop.default_dhcp_options_id}"

  provisioner "local-exec" {
    command = "sleep 5"
  }
=======
/* Network */
data "oci_identity_availability_domains" "availability_domains" {
  compartment_id = "${oci_identity_compartment.oke_compartment.id}"
}

############################################
# Local variables
############################################

locals {
  tcp_protocol = "6"
  all_protocol = "all"
  anywhere = "0.0.0.0/0"
}

############################################
# Create VCN
############################################

resource "oci_core_vcn" "vcn-workshop" {
  cidr_block = "${var.vcn_cidr}"
  compartment_id = "${oci_identity_compartment.oke_compartment.id}"
  dns_label = "vcnworkshop"
}

############################################
# Create Internet Gateway
############################################

resource "oci_core_internet_gateway" "ig-workshop" {
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"
}

############################################
# Create Route Table
############################################

resource "oci_core_route_table" "routetable" {
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"
  display_name = "Bastion Route Table"

  route_rules {
    destination = "${local.anywhere}"
//    destination_type = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.ig-workshop.id}"
  }
}

############################################
# Create Security List
############################################

resource "oci_core_security_list" "securitylist" {
  display_name = "Bastion Security List"
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"

  egress_security_rules = [
    {
      protocol = "${local.all_protocol}"
      destination = "${local.anywhere}"
    }
  ]

  ingress_security_rules = [
    {
      protocol = "${local.tcp_protocol}"
      source = "${local.anywhere}"

      tcp_options {
        "min" = 22
        "max" = 22
      }
    }
  ]
}


############################################
# Create Subnet
############################################
resource "oci_core_subnet" "sub01" {
  display_name = "sub01"
//  availability_domain = "${lookup(data.oci_identity_availability_domains.availability_domains.availability_domains[var.availability_domains -2],"name")}"
  cidr_block = "${var.sub_01}"
  dns_label = "sub01"
  security_list_ids = ["${oci_core_security_list.securitylist.id}"]
  compartment_id = "${oci_core_vcn.vcn-workshop.compartment_id}"
  vcn_id = "${oci_core_vcn.vcn-workshop.id}"
  route_table_id = "${oci_core_route_table.routetable.id}"
  dhcp_options_id = "${oci_core_vcn.vcn-workshop.default_dhcp_options_id}"

  provisioner "local-exec" {
    command = "sleep 5"
  }
>>>>>>> d8b30a0541bf932efefafabb291e8a58d4211d77
}