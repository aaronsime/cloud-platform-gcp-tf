resource "google_composer_environment" "composer" {
  provider = "google-beta"
  name   = "composer-${var.environment}"
  region = var.region
  project = var.project_id

  storage_config {
    bucket = ""
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

  config {
    environment_size = "ENVIRONMENT_SIZE_SMALL"

    node_config {
      machine_type          = "e2-medium"
      service_account       = google_service_account.composer_sa.email
    }

    software_config {
      image_version = "composer-2.5.2-airflow-2.6.3" # pick latest compatible version
      airflow_config_overrides = {
        core-dags_are_paused_at_creation = "True"
      }
    }
  }
}
