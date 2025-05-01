
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
  account_id   = "github-actions-sa"
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


# Cloud service account to manage snowflake ingestion and orchestration
resource "google_service_account" "cloud_sa" {
  account_id   = "cloud-sa"
  display_name = "Cloud Service Account"
}

resource "google_project_iam_member" "secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "pubsub_publisher" {
  project = var.project_id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "cloud_function_invoker" {
  project = var.project_id
  role    = "roles/cloudfunctions.invoker"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "event_receiver" {
  project = var.project_id
  role    = "roles/eventarc.eventReceiver"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "log_writter" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "cloud_run_developer" {
  project = var.project_id
  role    = "roles/run.developer"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "cloud_run_artifact_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:service-478434158240@serverless-robot-prod.iam.gserviceaccount.com"
}

resource "google_project_iam_member" cloud_function_admin {
  project = var.project_id
  role    = "roles/cloudfunctions.admin"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = google_service_account.cloud_sa.member
}

resource "google_bigquery_dataset_iam_member" "cr_editor" {
  dataset_id = var.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_bigquery_dataset_iam_member" "cr_viewer" {
  dataset_id = var.dataset_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${google_service_account.cloud_sa.email}"
}

resource "google_project_iam_member" "cr_bigquery_user" {
  project = var.project_id
  role    = "roles/bigquery.user"
  member  = "serviceAccount:${google_service_account.cloud_sa.email}"
}

# Access for snowflakes service account
resource "google_storage_bucket_iam_member" "snowflake_stage_list" {
  bucket = google_storage_bucket.outbound_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:mviiqjgowm@sfc-au-1-nla.iam.gserviceaccount.com"
}

# DBT service account for dev
resource "google_service_account" "dbt_dev_sa" {
  account_id   = "dbt-dev-sa"
  display_name = "dbt service account for dev"
}

resource "google_bigquery_dataset_iam_member" "editor" {
  dataset_id = var.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_dev_sa.email}"
}

resource "google_bigquery_dataset_iam_member" "viewer" {
  dataset_id = var.dataset_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${google_service_account.dbt_dev_sa.email}"
}

resource "google_project_iam_member" "bigquery_user" {
  project = var.project_id
  role    = "roles/bigquery.user"
  member  = "serviceAccount:${google_service_account.dbt_dev_sa.email}"
}
