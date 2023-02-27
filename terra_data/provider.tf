terraform {
    required_providers {
        databricks = {
            source = "databrickslabs/databricks"
            version = "0.3.1"
        }
    }
}


provider "azurerm" {
    features {}
    client_id = ""
    client_secret = ""
    tenant_id = ""
    subscription_id = ""

}
