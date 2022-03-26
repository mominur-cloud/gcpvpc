variable "project" {
  default = var.project
}

variable "credentials_file" {
  default = var.credentials
}

variable "region" {
  default = var.region
}

variable "name" {
  default = variable.name
}
variable "zone" {
  default = var.zone
}
variable "public_subnet_cidr" {
  default = "10.10.5.0/24"
}
variable "private_subnet_cidr" {
  default = "10.10.13.0/24"
}
