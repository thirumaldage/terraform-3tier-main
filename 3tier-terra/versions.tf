terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.0.0"
    }
    time = {
      source = "hashicorp/time"
    version = ">= 0.6.0"
    }
  }

  # backend azurerm {
  #   resource_group_name = "terraform-storage-rg"
  #   storage_account_name = "atg1212"
  #   container_name = "terra"
  #   key = "terraform.tfstate"
  # }
  
}

provider "azurerm" {
  features {}
}