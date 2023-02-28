variable "ResourceGroup" {
    description = "Resourcegroup"
    default = "RG7"
}

variable "workspace" {
    description = "Work Space"
    default = "SIGWorkSpace1"
}

variable "instance_pool_name" {
    description = "pool name"
    default = "SIGpool"
}

variable "sku"{
    description = "sku subscription"
    default = "standard"
} 

variable "local_disk" {
    default = true
}
variable "long_term_support" {
    default = true
}
variable "min_idle_instances" {
    default = 0
}

variable "max_capacity" {
    default = 10
}

variable "idle_instance_autotermination_minutes" {
    default = 10
}

variable "autotermination_minutes" {
    default = 20
}

variable "createdby" {
    default = "DevOps"
}

variable "Cluster" {
    description = "cluster"
    default = "SIGCluster1"
}

variable "location" {
    description = "The region"
    default = "centralus"
}

variable "spark_version" {
    description = "spark Runtime Version for databricks cluster"
    default = "7.3.x-scala2.12"
}

variable "node_type_id" {
    description = "Type of worker nodes for databricks cluster"
    default = "Standard_DS3_v2"
}

variable "min_workers" {
    description = "Minimum workers in a cluster"
    default = 1
}


variable "max_workers" {
    description = "Maximum workers in a cluster"
    default = 4
}

variable "client_id" {
    type = string
}

variable "client_secret" {
    type = string
}

variable "tenant_id" {
    type = string
}

variable "subscription_id" {
    type = string
}