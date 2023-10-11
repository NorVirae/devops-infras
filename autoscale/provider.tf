
variable "path" {default = "/home/vyra/Documents/devops/terraform/credentials"}

variable "region" {
  default = "europe-west4-a"
}

provider "google" {
    project = "blackhards"
    region = var.region
    credentials = "${file("${var.path}/servicekey.json")}"
}