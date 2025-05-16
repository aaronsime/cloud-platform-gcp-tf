resource "google_logging_project_sink" "cloud_run_error_sink" {
  name        = "cloud-run-error-logs"
  destination = "pubsub.googleapis.com/projects/dev-cloud-warehouse/topics/cloud-run-logs"

  filter = <<EOT
resource.type="cloud_run_revision" AND severity>=ERROR
EOT

  unique_writer_identity = true
}
