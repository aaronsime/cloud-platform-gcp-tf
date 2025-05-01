resource "google_bigquery_table" "olist_orders" {
  dataset_id = var.dataset_id
  table_id   = "olist_orders"
  schema     = jsonencode([
    { name = "order_id", type = "STRING" },
    { name = "customer_id", type = "STRING" },
    { name = "order_status", type = "STRING" },
    { name = "order_purchase_timestamp", type = "TIMESTAMP" },
    { name = "order_approved_at", type = "TIMESTAMP" },
    { name = "order_delivered_carrier_date", type = "TIMESTAMP" },
    { name = "order_delivered_customer_date", type = "TIMESTAMP" },
    { name = "order_estimated_delivery_date", type = "TIMESTAMP" }
  ])
  description = "Olist orders raw table"
}

resource "google_bigquery_table" "olist_customers" {
  dataset_id = var.dataset_id
  table_id   = "olist_customers"
  schema     = jsonencode([
    { name = "customer_id", type = "STRING" },
    { name = "customer_unique_id", type = "STRING" },
    { name = "customer_zip_code_prefix", type = "STRING" },
    { name = "customer_city", type = "STRING" },
    { name = "customer_state", type = "STRING" }
  ])
  description = "Olist customers raw table"
}

resource "google_bigquery_table" "olist_geolocation" {
  dataset_id = var.dataset_id
  table_id   = "olist_geolocation"
  schema     = jsonencode([
    { name = "geolocation_zip_code_prefix", type = "STRING" },
    { name = "geolocation_lat", type = "FLOAT" },
    { name = "geolocation_lng", type = "FLOAT" },
    { name = "geolocation_city", type = "STRING" },
    { name = "geolocation_state", type = "STRING" }
  ])
  description = "Olist geolocation raw table"
}
