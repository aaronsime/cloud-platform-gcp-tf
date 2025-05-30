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

variable "snowflake_password" {
  description = "password used to log into snowflake"
  type        = string
  sensitive   = true
}

variable "snowflake_password_run" {
  description = "password used to run dbt against snowflake"
  type        = string
  sensitive   = true
}

variable "dataset_id" {
  description = "The dataset ID for the BigQuery dataset"
  type        = string
}

variable "gemini_token" {
  description = "Gemini API key"
  type        = string
  sensitive   = true
}

variable "target_buckets" {
  type    = list(string)
  default = []
  description = "List of GCS buckets to grant permissions to"
}