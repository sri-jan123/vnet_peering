terraform {
  backend "azurerm" {
    resource_group_name  = "variablestrgrp"
    storage_account_name = "tfstate012256"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}