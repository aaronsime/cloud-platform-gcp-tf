resource "google_cloud_run_v2_job" "snowflake_ingestion" {
  name     = "cloud-scheduler-cloudrun-job-snowflake-ingestion"
  location = var.region

  labels = {
    environment = var.environment
    job         = "snowflake_ingest"
    service     = var.service
  }

  template {
    template {
      service_account = google_service_account.cloud_sa.email
      timeout         = "21600s"
      containers {
        image = "${var.region}-docker.pkg.dev/dev-cloud-warehouse-${var.environment}/cloud-warehouse-snowflake-${var.environment}/cloud-warehouse-snowflake-dev-${var.environment}:latest"

        resources {
          limits = {
            cpu    = "2"
            memory = "8192Mi"
          }
        }

        env {
          name  = "PROJECT_ID"
          value = var.project_id
        }
        env {
          name  = "ENVIRONMENT"
          value = var.environment
        }
      }
    }
  }
}
