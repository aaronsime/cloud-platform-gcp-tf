resource "google_project_service" "iam_api" {
  service = "iam.googleapis.com"
}

resource "google_project_service" "artifact_registry_api" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
}

resource "google_project_service" "cloud-resource-manager-api" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "composer" {
  project = var.project_id
  service = "composer.googleapis.com"
}

resource "google_project_service" "cloud_build" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"
}

resource "google_project_service" "scheduler_api" {
  project = var.project_id
  service = "cloudscheduler.googleapis.com"
}

resource "google_project_service" "cloudfunctions" {
  project = var.project_id
  service = "cloudfunctions.googleapis.com"
}

resource "google_project_service" "bigquerydatatransfer" {
  project = var.project_id
  service = "bigquerydatatransfer.googleapis.com"
}

resource "google_project_service" "eventarc" {
  project = var.project_id
  service = "eventarc.googleapis.com"
}

resource "google_project_service" "pubsub" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}
