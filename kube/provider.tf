data "google_client_config" "default" {}

# provider "kubernetes" {
#   host                   = "https://${module.gke.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }

provider "google" {
    project = var.project
    region = var.region
    credentials = file("${var.path}/servicekey.json")

}

provider "google-beta" {
    project = var.project
    region = var.region
    credentials = file("${var.path}/servicekey.json")

}