resource "google_pubsub_topic" "cloud_scheduler_topic" {
  name = "cloud-scheduler-topic"
}

resource "google_pubsub_topic" "cloud_scheduler_transform_topic" {
  name = "cloud-scheduler-transform-topic"
}
