resource "google_artifact_registry_repository" "cloud_orchestration" {
  provider      = google-beta
  location      = var.region
  repository_id = "cloud-warehouse-snowflake-${var.environment}"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "log_agent" {
  provider      = google-beta
  location      = var.region
  repository_id = "cloud-warehouse-snowflake-${var.environment}-log-agent"
  format        = "DOCKER"
}