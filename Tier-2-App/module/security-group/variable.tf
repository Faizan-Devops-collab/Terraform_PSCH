##Define variables for sg

variable "project_name"{
description = "The name of the project"
type        = string
}

variable "environment" {
    description = "The type of Environment"
    type = string
}

variable "vpc_id" {
    description = "The VPC used"
    type = string
}