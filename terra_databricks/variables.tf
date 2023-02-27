variable "ResourceGroup" {
    description = "Resource Group."
    default = "RG7"
}

variable "workspace" {
    description = "Work Space"
    default = "SIGWorkSpace1"
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