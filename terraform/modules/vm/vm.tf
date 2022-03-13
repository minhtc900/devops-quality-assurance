resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_B1s"
  admin_username = var.vm_admin_username
  disable_password_authentication = true
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzutxzZSsLr2xdnSfGk3NTA+wyL8V7GUPu3fw1/pTbOk1yukZgKpDOSyTONSbF8CIfgMwxHtK6ZTAjToNC2agA434tm/dzIa2yceqgiHP0Yc9yZG+P6FPOMzLdS+mi42uWirvidWkNRG2ePBpwH2aBfn6B4ca2XwBpHwyVrKFV0znvGfNpmtgiLJFlFdDgZEJqjpnCgCkSm/fqEZHVokDXaGyp69LJnFb9iByTn6p0RmljR7eodeBTkWu4kU2AkMcfASWRUvngOtYevemxjgtvrYQe/Bu5flpoKtSEb3MAsMiCAJP5+Hv77TgFQX+AVwJVhWbFG10SarSqvKKGnX4YlNHbgXe+t10OXDYB6rZdsx11iuSaLPai3eCmJr2kw98dkKAuxV/S1KCDU7NVDdfsDUkYTxQl4XtZg/rUFeDXGtQbXc5sVeSBt/h4BW/y0hxCys3U7ijg/vWDJngRX2Fss+DrDQ+gfB/ezxRXQqkcXWbmv3/B7MZMtcKFweOZRxaxEw5rrRTtAU7zxiixTr0dvRTOKNeZY7YIqacT7wkkKu/0ht4PQ+BWY7JJjl4Ud8v9l7cQMb72kI5I0pGL/TUbWlvgyZfSrFtjx5HXMmrSzcheKhtQsQD+et6x47yiC8Vgv0v1dDYllZBR7dBgSs6jRnVgZfbl5ghE7G02sAlzzQ== minhtc900@Minhs-MacBook-Air.local"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}