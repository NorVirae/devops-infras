resource "google_compute_firewall" "allow_http" {
  name = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  target_tags = ["allow-http"]
}

resource "google_compute_firewall" "allow_http" {
  name = "allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8080"]
  }

  target_tags = ["allow-https"]
}