provider "azurerm" {
  tenant_id       = "eb326955-4b8b-416f-a799-6a22255997c6"
  subscription_id = "5071732c-4dd9-4ada-98a7-4e6599fde956"
  client_id       = "bf554695-f684-4571-8cbc-125f154c7e8e"
  client_secret   = "Pza0P0M~jkKMbmN3nEnwx08x2hRGi-uyf2"
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "${var.resource_group}"
    storage_account_name = "tstate86"
    container_name       = "tstate"
    key                  = "/cynL0f8XG1W9FSVqMmWJfwo2Az5xhvkEn3TCw/frM3VuY3iUjR+rXOiC/zWVzQWD6tcnAsI3wrW+ASt+x1p0g=="
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${module.resource_group.resource_group_name}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "vm" {
  source           = "../../modules/vm"
  location         = "${var.location}"
  resource_group   = "${module.resource_group.resource_group_name}"
  application_type = "${var.application_type}"
  resource_type    = "vm"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip_address_id = "${module.publicip.public_ip_address_id}"
  vm_admin_username  = var.vm_admin_username 
}