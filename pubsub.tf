resource "google_pubsub_topic" "cloud_scheduler_topic" {
  name = "cloud-scheduler-topic"
}

resource "google_pubsub_topic" "cloud_scheduler_transform_topic" {
  name = "cloud-scheduler-transform-topic"
}

resource "google_pubsub_topic" "cloud_run_logs" {
  name = "cloud-run-logs"
}

resource "google_pubsub_subscription" "n8n_log_subscriber" {
  name  = "n8n-log-subscriber"
  topic = "projects/dev-cloud-warehouse/topics/cloud-run-logs"

  push_config {
    push_endpoint = "https://greenazza.app.n8n.cloud/webhook-test/pubsub-log"

    oidc_token {
      service_account_email = "cloud-sa@dev-cloud-warehouse.iam.gserviceaccount.com"
    }
  }

  ack_deadline_seconds = 10
}
