
resource "google_compute_instance" "default" {
  count = length(var.name_count)
  name         = "core0${count.index + 1}"
  machine_type = var.enviroment == "production"? var.machine_type : var.machine_type_dev
  zone         = var.zone
  can_ip_forward = "false"
  description = "This is our Virtual Machine"

  tags = [ "allow-http" ]

  boot_disk {
    initialize_params {
      image = var.image
      size = "20"
    }
  }


  labels = {
    name = "core0${count.index + 1}"
    machine_type = var.enviroment == "production"? var.machine_type : var.machine_type_dev
  }

  network_interface {
    network = "default"
  }

  metadata = {
    size = "20"

  }

  metadata_startup_script = "echo hi > /text.txt"

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

# output "instance_id" {
#   value = join(",", google_compute_instance.default.id)
# }
