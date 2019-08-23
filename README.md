# Oracle Container Engine for Kubernetes (OKE) and Bastion Host with Resource Manager in Oracle Cloud Infrastructure (OCI)

This tutorial is made to create a OKE Cluster (Oracle Container Engine for Kubernetes) and a Bastion Host to manage it on top of Oracle Cloud Infrastructure (OCI).

All here was made to make [this Cloud Native Workshop](https://oracle.github.io/learning-library/workshops/container-native-development/?version=Virtual+Box&page=LabGuide100.md) easier and replace the following steps:

* Lab 200: Install and Configure Virtual Box
* Lab 200: Provision Kubernetes Using Terraform: Set Up Oracle Cloud Infrastructure
* Lab 200: Provision Kubernetes Using Terraform: Provision Kubernetes Using Terraform

The localhost connection will be made trough a SSH tunnel with the Bastion Host forwarding the remote 8001 port to localhost.

## Prerequisites

* Oracle Cloud Account (can be a simple trial account)
* Github Account
* Wercker Account

## What we will use

* [Oracle Cloud Infrastructure Console](https://console.us-ashburn-1.oraclecloud.com/)
* [Terraform Configuration Language for Oracle Cloud](https://www.terraform.io/docs/providers/oci/index.html) to be used with [Resource Manager](https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Concepts/resourcemanager.htm) and provision our Bastion Host, the associated cloud infrastructure and manage the IAM (Identity and Access Management)service
* [Oracle Container Engine for Kubernetes (OKE)](https://docs.cloud.oracle.com/iaas/Content/ContEng/Concepts/contengoverview.htm) to create a managed Kubernetes Cluster
* [Oracle Cloud Infrastructure Registry (OCIR)](https://docs.cloud.oracle.com/iaas/Content/Registry/Concepts/registryoverview.htm) to store and share Docker container images
* [Wercker](https://app.wercker.com/) to manage our container pipelines

## Labs

**The labs from 040 to 070 will walk you through the creation of all the resources managed by the Resource Manager in the Hands-On Lab. So, if you want to provision a standardized Oracle Cloud Infrastructure without publish security information in logs or other files, follow the labs from 010 to 090**

*In this workshop, creating resources manually is a more secure way to work, since we made here some simplifications that expose security informations that must not be shared or exposed. At the end of the Lab 050, there is a Terraform configuration zip file that does not expose the security information managed at the Lab 050. If you use this fil, you can jump directly to the Lab 100 after the completion of Lab 050.*

* *Lab 040: Understanding the OCI concepts.*
* *Lab 050: Accessing the Tenancy and configuring the IAM (and other accounts).*
* *Lab 060: Creating and configuring the cloud infrastructure resources (except Bastion Host VM).*
* *Lab 070: Creating, accessing and configuring the Bastion Host VM.*
* Lab 100: Using the Resource Manager to create infrastructure resources and configure Bastion Host VM.
* Lab 200: Creating and managing the Oracle Container Engine for Kubernetes (OKE) cluster.
