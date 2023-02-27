terraform {
    required_providers {
        azurerm = {
            version = ">= 2.90.0"
        }
        databricks = {
            source = "databricks/databricks"
            version = "0.4.6"
        
        }
    }
    required_version = ">=0.14"
}

##Azure required_provider
provider "azurerm" {
    features {}
}

//Databricks Provider
provider "databricks" {
    azure_workspace_resource_id = azurerm_databricks_workspace.worksapce.id
}

//Createing Resource Group
resource "azure_resource_group" "Resourcegroup" {
    name = "${var.ResourveGroup}"
    location = var.location
}

//Creating WorkSpace
resource "azurerm_databricks_workspace" "workspace" {
    location = azure_resource_group.ResourceGroup.location
    name = "${var.WorkSpace}"
    resource_group_name = azure_resource_group.ResourceGroup.name
    sku = "standard"
}

resource "databricks_user" "my_user" {
    user_name = "sharath.r@sigmoidanalytics.com"
    display_name = "Admin User"
}

//creating databricks cluster 
resource "databricks_cluster" "cluster" {
    cluster_name = "${var.Cluster}"
    spark_version = var.spark_version
    node_type_id = var.node_type_id
    autotermination_minutes = 90
    autoscale {
        min_workers = var.min_workers
        max_workers = var.max_workers
    }

    custom_tags = {
        Department = "DevOps"
    }
}
