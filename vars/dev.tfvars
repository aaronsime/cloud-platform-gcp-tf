environment    = "dev"
project_id     = "dev-cloud-warehouse"
project_number = "478434158240"
region         = "us-central1"
dataset_id     = "raw"

target_buckets = [
  "outbound-snowflake-dev",
  "dbt-logs-dev",
  "dbt-manifest-dev-dev-cloud-warehouse"
]
