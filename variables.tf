variable "region" {
    description = "The AWS region to deploy to."
    type        = string
    default     = "us-west-2"
}
  
variable "cluster_name" {
description = "The name of the EKS cluster."
type        = string
}

variable "cluster_version" {
description = "The Kubernetes version for the EKS cluster."
type        = string
default     = "1.21"
}

variable "node_groups" {
description = "The node groups configuration."
type = map(object({
    desired_capacity = number
    max_capacity     = number
    min_capacity     = number
    instance_type    = string
    key_name         = string
}))
}
  