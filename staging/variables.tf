variable "name" {
  default = "core01"
}

variable "machine_type" {
  type = map
  default = {
    dev = "e2-micro",
    prod = "nl-stanard-1"
  }
}

variable "zone" {
  default = "us-west2-b"
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
  default = "us-west2-b"
}


variable "name_count" {
  default = ["core01", "core02", "core03"]
  
}