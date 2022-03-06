# Azure GUIDS
variable "subscription_id" {default = "5071732c-4dd9-4ada-98a7-4e6599fde956"}
variable "client_id" {default = "bf554695-f684-4571-8cbc-125f154c7e8e"}
variable "client_secret" {default = "BmLL.VkNoYdp~d7_Wge919nacW4ruO7ZyR"}
variable "tenant_id" {default = "eb326955-4b8b-416f-a799-6a22255997c6"}

# Resource Group/Location
variable "location" {default = "eastus"}
variable "resource_group" {default = "udacity-demo"}
variable "application_type" {default = "web"}

# Network
variable virtual_network_name {default = "udacityNetwork"}
variable address_prefix_test {default = "10.5.1.0/24"}
variable address_space {default = "10.5.0.0/16"}

# Virtual Machine
variable vm_admin_username {default = "admin"}