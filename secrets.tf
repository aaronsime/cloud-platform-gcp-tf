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

resource "google_secret_manager_secret" "gemini_api_key" {
  secret_id = "GEMINI_API_KEY"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "gemini_api_key_version" {
  secret      = google_secret_manager_secret.gemini_api_key.id
  secret_data = var.gemini_token
}

