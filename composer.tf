# resource "google_composer_environment" "composer" {
#  provider = google-beta
#  name     = "composer-${var.environment}"
#  region   = var.region
#  project  = var.project_id

#  storage_config {
#    bucket = ""
#}

 # timeouts {
 #   create = "120m"
 #   update = "120m"
 #   delete = "60m"
 # }

 # config {
 # environment_size = "ENVIRONMENT_SIZE_SMALL"

#    workloads_config {
#      scheduler {
#        cpu        = 2
#        memory_gb  = 4
#        storage_gb = 10
#      }
#      web_server {
#        cpu        = 1
#        memory_gb  = 2
#        storage_gb = 10
#      }
#      worker {
#        cpu        = 2
#        memory_gb  = 4
#        storage_gb = 10
#        min_count  = 1
#        max_count  = 3
#      }
#    }

#    software_config {
#      image_version = "composer-2.11.5-airflow-2.9.3"
#      airflow_config_overrides = {
#        core-dags_are_paused_at_creation = "True"
#      }
#    }

#    node_config {
#      service_account = google_service_account.composer_sa.email
#    }
#  }
# }
