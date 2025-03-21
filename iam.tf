
resource "google_service_account" "storage_access_sa" {
  account_id   = "sf-storage-access"
  display_name = "Service Account for Snowflake Storage Access"
}
