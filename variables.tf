variable "project_id" {
  description = "The project ID for the GCP project"
}

variable "project_number" {
  description = "The project number for the GCP project"
}

variable "region" {
  description = "The region for the GCP project"
}

variable "environment" {
  description = "The environment for the GCP project"
}

variable "service" {
  description = "Service Name. Eg. cloud-scheduler"
  type        = string
  default     = "cloud-scheduler"
}