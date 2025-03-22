
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
