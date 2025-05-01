resource "google_bigquery_table" "olist_orders" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_ORDERS"
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

resource "google_bigquery_table" "olist_order_items" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_ORDER_ITEMS"
  schema     = jsonencode([
    { name = "order_id", type = "STRING" },
    { name = "order_item_id", type = "STRING" },
    { name = "product_id", type = "STRING" },
    { name = "seller_id", type = "STRING" },
    { name = "shipping_limit_date", type = "TIMESTAMP" },
    { name = "price", type = "FLOAT" },
    { name = "freight_value", type = "FLOAT" }
  ])
  description = "Olist order items raw table"
}

resource "google_bigquery_table" "olist_customers" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_CUSTOMERS"
  schema     = jsonencode([
    { name = "customer_id", type = "STRING" },
    { name = "customer_unique_id", type = "STRING" },
    { name = "customer_zip_code_prefix", type = "STRING" },
    { name = "customer_city", type = "STRING" },
    { name = "customer_state", type = "STRING" }
  ])
  description = "Olist customers raw table"
}

resource "google_bigquery_table" "olist_products" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_PRODUCTS"
  schema     = jsonencode([
    { name = "product_id", type = "STRING" },
    { name = "product_category_name", type = "STRING" },
    { name = "product_name_lenght", type = "INT64" },
    { name = "product_description_lenght", type = "INT64" },
    { name = "product_photos_qty", type = "INT64" },
    { name = "product_weight_g", type = "INT64" },
    { name = "product_length_cm", type = "INT64" },
    { name = "product_height_cm", type = "INT64" },
    { name = "product_width_cm", type = "INT64" }
  ])
  description = "Olist products raw table"
}

resource "google_bigquery_table" "olist_sellers" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_SELLERS"
  schema     = jsonencode([
    { name = "seller_id", type = "STRING" },
    { name = "seller_zip_code_prefix", type = "STRING" },
    { name = "seller_city", type = "STRING" },
    { name = "seller_state", type = "STRING" }
  ])
  description = "Olist sellers raw table"
}

resource "google_bigquery_table" "olist_geolocation" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_GEOLOCATION"
  schema     = jsonencode([
    { name = "geolocation_zip_code_prefix", type = "STRING" },
    { name = "geolocation_lat", type = "FLOAT" },
    { name = "geolocation_lng", type = "FLOAT" },
    { name = "geolocation_city", type = "STRING" },
    { name = "geolocation_state", type = "STRING" }
  ])
  description = "Olist geolocation raw table"
}

resource "google_bigquery_table" "olist_order_reviews" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_ORDER_REVIEWS"
  schema     = jsonencode([
    { name = "review_id", type = "STRING" },
    { name = "order_id", type = "STRING" },
    { name = "review_score", type = "INT64" },
    { name = "review_comment_title", type = "STRING" },
    { name = "review_comment_message", type = "STRING" },
    { name = "review_creation_date", type = "TIMESTAMP" },
    { name = "review_answer_timestamp", type = "TIMESTAMP" }
  ])
  description = "Olist order reviews raw table"
}

resource "google_bigquery_table" "olist_order_payments" {
  dataset_id = var.dataset_id
  table_id   = "OLIST_ORDER_PAYMENTS"
  schema     = jsonencode([
    { name = "order_id", type = "STRING" },
    { name = "payment_sequential", type = "INT64" },
    { name = "payment_type", type = "STRING" },
    { name = "payment_installments", type = "INT64" },
    { name = "payment_value", type = "FLOAT" }
  ])
  description = "Olist order payments raw table"
}

resource "google_bigquery_table" "product_category_translation" {
  dataset_id = var.dataset_id
  table_id   = "PRODUCT_CATEGORY_TRANSLATION"
  schema     = jsonencode([
    { name = "product_category_name", type = "STRING" },
    { name = "product_category_name_english", type = "STRING" }
  ])
  description = "Olist product category translation raw table"
}
