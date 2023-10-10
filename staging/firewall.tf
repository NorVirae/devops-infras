resource "google_compute_firewall" "allow_http" {
  name = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80"]
  }
  source_tags = ["allow-http"]
  target_tags = ["allow-http"]
}

resource "google_compute_firewall" "allow_https" {
  name = "allow-https"
  network = "default"
  
  allow {
    protocol = "tcp"
    ports = ["8080"]
  }
  
  source_tags = ["allow-https"]
  target_tags = ["allow-https"]
}