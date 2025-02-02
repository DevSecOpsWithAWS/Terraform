variable "instances" {
  type = map
  default = {
    mysql = "t3.micro"
    backend = "t2.micro"
    frontend = "t2.micro"
  } 
}
variable "zone_id" {
  default = "Z08526524X8HK8MJVJQN"
}
variable "domain_name" {
  default = "sridevsecops.store"
}