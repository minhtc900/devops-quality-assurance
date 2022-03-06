# Azure GUIDS
variable "subscription_id" {5071732c-4dd9-4ada-98a7-4e6599fde956}
variable "client_id" {bf554695-f684-4571-8cbc-125f154c7e8e}
variable "client_secret" {BmLL.VkNoYdp~d7_Wge919nacW4ruO7ZyR}
variable "tenant_id" {eb326955-4b8b-416f-a799-6a22255997c6}

# Resource Group/Location
variable "location" {eastus}
variable "resource_group" {udacity-demo}
variable "application_type" {web}

# Network
variable virtual_network_name {udacityNetwork}
variable address_prefix_test {10.5.1.0/24}
variable address_space {10.5.0.0/16}

# Virtual Machine
variable vm_admin_username {admin}