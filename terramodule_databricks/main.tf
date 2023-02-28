module "Mymodule" {
  source                                = "./Mymodule"
  client_id                             = var.client_id
  client_secret                         = var.client_secret
  tenant_id                             = var.tenant_id
  subscription_id                       = var.subscription_id
  ResourceGroup                         = var.ResourceGroup
  location                              = var.location
  workspace                             = var.workspace
  instance_pool_name                    = var.instance_pool_name
  Cluster                               = var.Cluster
  min_workers                           = var.min_workers
  max_workers                           = var.max_workers
  sku                                   = var.sku
  local_disk                            = var.local_disk
  long_term_support                     = var.long_term_support
  min_idle_instances                    = var.min_idle_instances
  max_capacity                          = var.max_capacity
  idle_instance_autotermination_minutes = var.idle_instance_autotermination_minutes
  autotermination_minutes               = var.autotermination_minutes
  createdby                             = var.createdby
}