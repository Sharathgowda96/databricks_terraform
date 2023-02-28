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
}

provider "databricks" {
    azure_workspace_resource_id = azurerm_databricks_workspace.workspace.id
} 

resource "azurerm_resource_group" "resourcegroup" {
  name     = "${var.ResourceGroup}"
  location = "${var.location}"
}

resource "azurerm_databricks_workspace" "workspace" {
    location = azurerm_resource_group.resourcegroup.location
    name = "${var.workspace}"
    resource_group_name = azurerm_resource_group.resourcegroup.name
    sku = "${var.sku}"
}

data "databricks_node_type" "smallest" {
  depends_on = [azurerm_databricks_workspace.workspace]
  local_disk = "${var.local_disk}"
}

data "databricks_spark_version" "latest_lts" {
  depends_on = [azurerm_databricks_workspace.workspace]  
  long_term_support = "${var.long_term_support}"
}

resource "databricks_instance_pool" "pool" {
    instance_pool_name = "${var.instance_pool_name}"
    min_idle_instances = "${var.min_idle_instances}"
    max_capacity = "${var.max_capacity}"
    node_type_id = data.databricks_node_type.smallest.id

    idle_instance_autotermination_minutes = "${var.idle_instance_autotermination_minutes}"
}

resource "databricks_cluster" "shared_autoscaling" {
  depends_on = [azurerm_databricks_workspace.workspace] 
  instance_pool_id = databricks_instance_pool.pool.id
  cluster_name            = "${var.Cluster}"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = "${var.autotermination_minutes}"
  autoscale {
    min_workers = "${var.min_workers}"
    max_workers = "${var.max_workers}"
  }
  spark_conf = {
    "spark.databricks.io.cache.enabled" : true
  }
  custom_tags = {
    "createdby" = "${var.createdby}"
  }
}