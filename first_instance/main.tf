
resource "google_compute_instance" "default" { 
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-west2-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}