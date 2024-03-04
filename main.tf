
resource "random_string" "random" {
  length  = 5
  special = false
  numeric = true
  upper   = false
  lower   = true
}

resource "azurerm_resource_group" "group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.group.name
  location                 = azurerm_resource_group.group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
