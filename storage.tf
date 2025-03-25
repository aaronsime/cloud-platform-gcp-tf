# Bucket for storing outbound data going to Snowflake
resource "google_storage_bucket" "outbound_bucket" {
  project       = var.project_id
  name          = "outbound-snowflake-${var.environment}"
  location      = var.region
  storage_class = "STANDARD"

  public_access_prevention = "enforced"
}

resource "google_storage_bucket_object" "create_folder_placeholders" {
  for_each = toset([
    "raw/olist/incoming/.keep",
    "archive/olist/.keep"
  ])

  name   = each.value
  bucket = google_storage_bucket.outbound_bucket.name
  content = ""
}
