#MariaDB user variable
variable "mariadbUser" {
  type        = string
  description = "mariadb User"
}

#MariaDB password variable
variable "mariadbPassword" {
  type        = string
  description = "mariadb Password"
}

# Azure Subscription Id
variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription Id"
}
# Azure Client Id/appId
variable "azure-client-id" {
  type        = string
  description = "Azure Client Id/appId"
}
# Azure Client Id/appId
variable "azure-client-secret" {
  type        = string
  description = "Azure Client Id/appId"
}
# Azure Tenant Id
variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant Id"
}
