resource "google_cloud_scheduler_job" "cloud_scheduler_daily" {
  paused           = var.environment == "prod" ? false : true
  name             = "cloud_scheduler_daily"
  schedule         = "30 9 * * *"
  time_zone        = "Pacific/Auckland"
  region           = var.region
  attempt_deadline = "1200s"
  description      = "Scheduled daily jobs at 9:30am"

  retry_config {
    retry_count = 1
  }

  pubsub_target {
    topic_name = "projects/${var.project_id}/topics/${google_pubsub_topic.cloud_scheduler_topic.name}"
    data       = base64encode("{\"schedule\": \"daily\"}")
  }
}
