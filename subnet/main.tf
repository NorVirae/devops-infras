resource "google_compute_network" "default" {
  name = "blackhards-network"
  auto_create_subnetworks = var.auto_create_subnets
  
}

resource "google_compute_subnetwork" "subnetwork" {
  name = "subnet"
  ip_cidr_range = "10.2.0.0/16"
  region = "europe-west4"
  network = google_compute_network.default.self_link
}


resource "google_compute_subnetwork" "sub1" {
  name = "sub1"
  ip_cidr_range = "10.3.0.0/16"
  region = "europe-west2"
  network = google_compute_network.default.self_link
}

resource "google_compute_subnetwork" "sub2" {
  name = "sub2"
  ip_cidr_range = "10.4.0.0/16"
  region = "europe-west1"
  network = google_compute_network.default.self_link
}

resource "google_compute_subnetwork" "sub3" {
  name = "sub3"
  ip_cidr_range = "10.5.0.0/16"
  region = "europe-west2"
  network = google_compute_network.default.self_link
}