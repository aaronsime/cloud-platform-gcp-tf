resource "google_bigquery_dataset" "raw_zone" {
  dataset_id = "raw"
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_dataset" "staging_zone" {
  dataset_id = "staging"
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_dataset" "intermediate_zone" {
  dataset_id = "intermediate"
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_dataset" "consume_zone" {
  dataset_id = "consume"
  project    = var.project_id
  location   = var.region
}
