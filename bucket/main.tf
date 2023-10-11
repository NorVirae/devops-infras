

resource "google_storage_bucket" "bucket" {
  count = 1
  name = var.bucket_name
  location = var.location
  storage_class = var.storage

  labels = {
    name = "blackhards-test"
    location = var.location
  }

  versioning {
    enabled = var.versioning
  }
}