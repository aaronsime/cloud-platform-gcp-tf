# The config below is used by the Github Workflows.  The Workspace names is replaced at run time
terraform {
  cloud {
    organization = "aaronpersonal"

    workspaces {
      name = "$TF_WORKSPACE"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.75.1"
    }
  }
}


provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}