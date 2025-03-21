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
