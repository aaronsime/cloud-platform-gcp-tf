resource "google_pubsub_topic" "log_errors" {
  name = "log-errors"
}

resource "google_cloud_run_service" "log_agent" {
  name     = "log-agent"
  location = var.region

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.environment}-cloud-warehouse/cloud-warehouse-snowflake-${var.environment}-log-agent/cloud-warehouse-snowflake-${var.environment}-log-agent:latest"

        env {
          name  = "ENVIRONMENT"
          value = var.environment
        }

        env {
          name  = "PROJECT_ID"
          value = var.project_id
        }

        env {
          name = "GEMINI_API_KEY"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.gemini_api_key.secret_id
              key  = "latest"
            }
          }
        }
      }

      service_account_name = google_service_account.cloud_sa.email
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}


resource "google_cloud_run_service_iam_member" "allow_pubsub" {
  service  = google_cloud_run_service.log_agent.name
  location = google_cloud_run_service.log_agent.location
  role     = "roles/run.invoker"
  member   = "serviceAccount:service-${var.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}

resource "google_eventarc_trigger" "log_agent_trigger" {
  name     = "log-agent-trigger"
  location = var.region

  matching_criteria {
    attribute = "type"
    value     = "google.cloud.pubsub.topic.v1.messagePublished"
  }

  transport {
    pubsub {
      topic = google_pubsub_topic.log_errors.id
    }
  }

  destination {
    cloud_run_service {
      service = google_cloud_run_service.log_agent.name
      region  = var.region
    }
  }

  service_account = google_service_account.cloud_sa.email
}
