resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}

resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.websubnetcidr]
}

resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.appsubnetcidr]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnetcidr]
}

#Azure Bastion subnet
resource "azurerm_subnet" "AzureBastionSubnet" {
  name = "AzureBastionSubnet"
  resource_group_name = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes = ["192.168.4.0/24"]
}
#Azure Bastion configuration for VMs access
resource "azurerm_public_ip" "pip" {
  name = "az-bastion-pip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method = "Static"
  sku =  "Standard"
}
#host bastion subnet
resource "azurerm_bastion_host" "bastion-host" {
  name                = "bastionaccess"
   resource_group_name = var.resource_group
  location            = var.location

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

#  Create Network Security Group (NSG)
resource "azurerm_network_security_group" "bastion_subnet_nsg" {
  name                = "bastion-nsg"
   resource_group_name = var.resource_group
  location            = var.location
}

# Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg_associate" {
  #depends_on = [ azurerm_network_security_rule.bastion_nsg_rule_inbound]    
  subnet_id                 = azurerm_subnet.AzureBastionSubnet.id
  network_security_group_id = azurerm_network_security_group.bastion_subnet_nsg.id
}
locals {
  bastion_inbound_ports_map = {
    "100" : "22", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "3389"
  } 
}
## NSG Inbound Rule for Bastion / Management Subnets
resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each = local.bastion_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name
}