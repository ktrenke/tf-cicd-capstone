variable "www_domain_name" {
    default = "www.fariasjett.com"
}

variable "root_domain_name" {
    default = "fariasjett.com"
}

variable "acm_arn" {
    default = "arn:aws:acm:us-east-1:264112607033:certificate/e245a491-ecce-4bc6-b057-9b0c90580871"
}

variable "zone_id" {
    default = "Z71T1IBLZFU2L"
}

variable "env" {
    description = "Deployment environment"
    default     = "production"
}

