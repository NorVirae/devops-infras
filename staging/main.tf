
resource "google_compute_instance" "default" {
  # count = length(var.name_count) 
  name         = "core01"
  machine_type = var.machine_type["dev"]
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  depends_on = [ google_compute_instance.second]
}



resource "google_compute_instance" "second" {
  # count = length(var.name_count) 
  name         = "core02"
  machine_type = var.machine_type["dev"]
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}




# Outputs

output "machine_type" {
  value = google_compute_instance.default.machine_type
}

output "name" {
  value = google_compute_instance.default.name
}

output "zone" {
  value = google_compute_instance.default.zone
}



output "machine_type1" {
  value = google_compute_instance.second.machine_type
}

output "name1" {
  value = google_compute_instance.second.name
}

output "zone1" {
  value = google_compute_instance.second.zone
}


# output "instance_id" {
#   value = join(",", google_compute_instance.default.id)
# }
