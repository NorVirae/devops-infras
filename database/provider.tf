
variable "path" {
    default = "/home/vyra/Documents/devops/terraform/credentials"
}

provider "google" {
    project = "blackhards"
    region = "europe-west4"
    credentials = "${file("${var.path}/servicekey.json")}"
}