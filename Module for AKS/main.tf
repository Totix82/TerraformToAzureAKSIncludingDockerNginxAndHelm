terraform {
  required_providers {
    azurerm = {}
	docker = {
      source = "kreuzwerker/docker"
    }
	
  }
}
#Configure the Azure Provider
provider "azurerm" { 
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret 
  tenant_id       = var.azure-tenant-id
}
# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet_names        = ["subnet1", "subnet2"]
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"  
    os_disk_size_gb = 2
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}
# To print information about the state rather than downloading from the cluster’s kubeconfig file
output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
}

resource "azurerm_kubernetes_cluster" "example" {
  provisioner "local-exec" {
    command = "sudo apt-get update -y"
  }
}

resource "azurerm_kubernetes_cluster" "example" {
  provisioner "local-exec" {
    command = "sudo apt-get install -y aptitude"
  }
}

resource "azurerm_kubernetes_cluster" "example" {
  provisioner "local-exec" {
    command = "sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release"
  }
}

resource "azurerm_kubernetes_cluster" "example" {
  provisioner "local-exec" {
    command = "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
  }
}

resource "azurerm_kubernetes_cluster" "example" {
  provisioner "local-exec" {
    command = "sudo apt-get install docker-ce docker-ce-cli containerd.io"
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx"
  ports {
    internal = 80
    external = 8000
  }
}

