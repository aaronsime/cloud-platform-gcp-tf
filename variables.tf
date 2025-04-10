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
