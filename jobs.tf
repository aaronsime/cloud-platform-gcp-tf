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
        image = "${var.region}-docker.pkg.dev/${var.environment}-cloud-warehouse/cloud-warehouse-snowflake-${var.environment}/cloud-warehouse-snowflake-${var.environment}:latest"

        resources {
          limits = {
            cpu    = "2"
            memory = "4096Mi"
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

        env {
          name = "SNOWFLAKE_PASSWORD"
          value_source {
            secret_key_ref {
              secret  = google_secret_manager_secret.snowflake_password.secret_id
              version = "latest"
            }
          }
        }
      }
    }
  }
}

resource "google_cloud_run_v2_job" "transform_dbt" {
  name     = "cloud-scheduler-cloudrun-job-transform-dbt"
  location = var.region

  labels = {
    environment = var.environment
    job         = "dbt_transform"
    service     = var.service
  }

  template {
    template {
      service_account = google_service_account.cloud_sa.email
      timeout         = "3600s" # 1 hour (adjust as needed)

      containers {
        image = "${var.region}-docker.pkg.dev/${var.environment}-cloud-warehouse/cloud-warehouse-snowflake-${var.environment}/cloud-warehouse-snowflake-${var.environment}:latest"

        resources {
          limits = {
            cpu    = "2"
            memory = "4096Mi"
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

        env {
          name  = "JOB_NAME"
          value = "refresh_facts"
        }

        env {
          name  = "SCHEDULE"
          value = "daily"
        }
      }
    }
  }
}
