
resource "google_service_account" "storage_access_sa" {
  account_id   = "sf-storage-access"
  display_name = "Service Account for Snowflake Storage Access"
}

resource "google_service_account" "composer_sa" {
  account_id   = "composer-service-account"
  display_name = "Service Account for Cloud Composer"
}

resource "google_project_iam_member" "composer_worker" {
  project = var.project_id
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.composer_sa.email}"
}

resource "google_project_iam_member" "storage_object_admin" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.composer_sa.email}"
}

resource "google_project_iam_member" "composer-worker-ext" {
  project    = var.project_id
  role       = "roles/composer.ServiceAgentV2Ext"
  member     = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}

# Service for the Github Actions
resource "google_service_account" "github_actions_sa" {
  account_id   = "github-actions-cloud-orchestration"
  display_name = "Github Actions Service Account"
}

resource "google_artifact_registry_repository_iam_member" "github_sa_gar_writer" {
  provider   = google-beta
  project    = var.project_id
  role       = "roles/artifactregistry.writer"
  location   = google_artifact_registry_repository.cloud_orchestration.location
  repository = google_artifact_registry_repository.cloud_orchestration.name
  member     = "serviceAccount:${google_service_account.github_actions_sa.email}"
}