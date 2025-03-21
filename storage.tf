# Bucket for storing outbound data going to Snowflake
resource "google_storage_bucket" "outbound_bucket" {
  project       = var.project_id
  name          = "outbound-snowflake-${var.environment}"
  location      = var.region
  storage_class = "STANDARD"

  public_access_prevention = "enforced"
}
