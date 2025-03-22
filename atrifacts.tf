resource "google_artifact_registry_repository" "docker" {
  provider      = google-beta
  location      = var.region
  repository_id = "composer-${var.environment}-docker"
  format        = "DOCKER"
}