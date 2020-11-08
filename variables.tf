variable "project_name" {
    default = "my-new-project"
}

variable "region" {
    description = "AWS region for infrastructure"
    default = "us-west-2"
}

variable "state_bucket" {
    default = "fj-tf-state"
}

