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
  admin_username      = var.vm_admin_username
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCn6wutENkms2AHL2UUQcJlh2+qFBZRhYpSZ+tSRERAyedG3n4AtDDrgiNXdAYsuAa2AGWrvrcoYHDdyYXvxsXmVQu1cKgaKMnSqglD2TcZyPLLFr5aJ0BEegGUU9ddSMFUi/UsQ5nbtVm9To6Ke7b496PDBAp4fnorn8QJXEj9GguToKuiZFEpH1mxlunOcTDgkqB/RR+h63XwxO3hwaRs92L0BsqjzAeFA5tUAvG/nXQJ3gx9/FJ6Ny/cVmvyTj45ol7uFpx4EoR1nKyIa1aJrnsvqoSeYJXQQj/6eeaE0rpPE/0GrnZKPfGD0MF/aH8uzr/Rh5ZkZSJTYFL626ZXFHy3+1MDJ2T/YCn12vlP48RaAPgil3m5h8Pajw/RatedIuTH49OKlAdvNnSSoreI7cw+xWhyuSQWYKOKe/btmCJ2IEhSBV35d4r9vRDLgROo1FBUiUH+mIDkWi83bkOMEDo+OgkTU/d+YU8avdty3AE0xuHsry00FKneySRViak= minhtc900@Minhs-MacBook-Air.local"
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
  computer_name  = "myvm"
  admin_username = var.vm_admin_username
  disable_password_authentication = true
}