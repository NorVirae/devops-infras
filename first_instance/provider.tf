variable "path" {
    type = string
    default = "/home/vyra/Documents/devops/terraform/credentials"
}

provider "google" {
    project = "helpful-surge-401108"
    region = "us-west2-b"
    credentials = file("${var.path}/servicekey.json")
}