variable "www_domain_name" {
    default = "www.fariasjett.net"
}

variable "root_domain_name" {
    default = "fariasjett.net"
}

variable "acm_arn" {
    default = "arn:aws:acm:us-east-1:264112607033:certificate/8e9ac8a3-b6d1-4caf-a3ff-ece764e9f154"
}

variable "zone_id" {
    default = "Z1QMD2W8SM1I04"
}

variable "env" {
    description = "Deployment environment"
    default     = "production"
}

