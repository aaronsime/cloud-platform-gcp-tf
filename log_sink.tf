resource "google_logging_project_sink" "errors_to_pubsub" {
  name        = "errors-to-pubsub"
  destination = "pubsub.googleapis.com/${google_pubsub_topic.log_errors.id}"
  filter      = "severity>=ERROR"
  unique_writer_identity = true
}

resource "google_pubsub_topic_iam_member" "allow_log_sink" {
  topic  = google_pubsub_topic.log_errors.name
  role   = "roles/pubsub.publisher"
  member = google_logging_project_sink.errors_to_pubsub.writer_identity
}

resource "google_pubsub_subscription" "log_agent_sub" {
  name  = "log-agent-sub"
  topic = google_pubsub_topic.log_errors.name

  push_config {
    push_endpoint = google_cloud_run_service.log_agent.status[0].url
    oidc_token {
      service_account_email = google_service_account.cloud_sa.email
    }
  }
}
