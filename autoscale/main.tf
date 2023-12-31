locals {
  name = "${var.path}- ${var.region}"
}

resource "google_compute_instance_template" "foobar" {
  name           = local.name
  machine_type   = "e2-micro"
  can_ip_forward = false

  tags = ["foo", "bar"]

  disk {
    source_image = data.google_compute_image.debian_9.id
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}








resource "google_compute_target_pool" "foobar" {
  name = "my-target-pool"
}

resource "google_compute_instance_group_manager" "foobar" {
  name = "my-igm"
  zone = "europe-west4-a"

  version {
    instance_template  = google_compute_instance_template.foobar.id
    name               = "primary"
  }

  target_pools       = [google_compute_target_pool.foobar.id]
  base_instance_name = "foobar"
}


resource "google_compute_autoscaler" "foobar" {
  name   = "my-autoscaler"
  zone   = "europe-west4-a"
  target = google_compute_instance_group_manager.foobar.id

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

data "google_compute_image" "debian_9" {
  family  = "debian-11"
  project = "debian-cloud"
}