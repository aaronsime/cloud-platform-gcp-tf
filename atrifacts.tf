resource "google_artifact_registry_repository" "cloud_orchestration" {
  provider      = google-beta
  location      = var.region
  repository_id = "cloud-warehouse-snowflake-${var.environment}"
  format        = "DOCKER"
}