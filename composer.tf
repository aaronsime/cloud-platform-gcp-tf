resource "google_composer_environment" "example" {
  name   = "composer-${var.environment}"
  region = var.region

  config {
    environment_size = "ENVIRONMENT_SIZE_SMALL"

    node_config {
      location              = var.region
      machine_type          = "e2-medium"
      service_account       = google_service_account.composer_sa.email
    }

    software_config {
      image_version = "composer-2.5.2-airflow-2.6.3" # pick latest compatible version
      airflow_config_overrides = {
        core-dags_are_paused_at_creation = "false"
      }
    }
  }
}
