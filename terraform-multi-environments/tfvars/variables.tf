variable "project" {
  default = "expense"
}
variable "environment" {
  
}
variable "instances" {
    default = ["mysql" , "backend" , "frontend"]
}

variable "zone_id" {
    default = "Z08526524X8HK8MJVJQN"
}

variable "domain_name" {
    default = "sridevsecops.store"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
    }
}