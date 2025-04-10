resource "google_secret_manager_secret" "snowflake_password" {
  provider  = google-beta
  secret_id = "snowflake-password"

  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret_version" "snowflake_password" {
  secret      = google_secret_manager_secret.snowflake_password.id
  secret_data = var.snowflake_password
}

resource "google_secret_manager_secret" "snowflake_password_run" {
  provider  = google-beta
  secret_id = "snowflake-password-run"

  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret_version" "snowflake_password_run" {
  secret      = google_secret_manager_secret.snowflake_password_run.id
  secret_data = var.snowflake_password_run
}
