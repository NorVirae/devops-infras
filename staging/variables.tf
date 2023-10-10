variable "name" {
  default = "core01"
}

variable "enviroment" {
  default = "dev"
}

variable "machine_type_dev" {
  default = "e2-micro"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "zone" {
  default = "europe-west4-a"
}

variable "image" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "path" {
  default = "/home/vyra/Documents/devops/terraform/credentials"
}

variable "project" {
  default = "blackhards"
}

variable "region" {
  default = "europe-west4-a"
}


variable "name_count" {
  default = ["core01"]
  
}