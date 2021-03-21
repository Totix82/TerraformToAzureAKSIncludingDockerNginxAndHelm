This module will
Configure the Azure Provider.
Create a resource group.
Create a virtual network (a.k.a. vnet) within the resource group.
Create an AkS Cluster with 2 nodes of 2 GBs.
Will update apt and install Aptitude.
Will install Docker.
Will Install Nginx.

File terraform.tfvar will hold Azure Subscription credentials' values.
File terraform.tf will hold Azure Subscription variables.
File outputs.tf will hold the client_certificate and the kube_config that is the printed information about the state 
(to avoid to downloading it from the cluster’s kubeconfig file)