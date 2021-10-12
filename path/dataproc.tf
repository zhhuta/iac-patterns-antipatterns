module "zhhuta-dataproc" {
  source = "git::https://github.com/pcln/terraform-gcp-dataproc.git//modules/dataproc"    

  name = "zhhuta-dataproc"
  team = "data_eng"
 
  cluster_config = {
    staging_bucket = "pcln-pl-data-dev-dataproc-staging"  
    gce_cluster_config = {
      metadata = {        
        "hive-metastore-instance" = "pcln-pl-data-dev:us-east4:guse4-hivemetastoredb-dev" 
        "cloudsql_proxy_project" = "pcln-pl-hotel-dev"       
        "additional-cloud-sql-instances" = "pcln-pl-hotel-dev:us-east4:guse4-htlmetadb-dev=tcp:3310"        
      }
      internal_ip_only = true         
    }

    master_config = {
      num_instances = 3
      machine_type  = "n1-standard-8"
      disk_config = {
        boot_disk_size_gb = 100 
      }
    }

    worker_config = {
      num_instances = 2
      machine_type  = "n1-standard-4"
      disk_config = {
        boot_disk_size_gb = 100
      }
    }

    preemptible_worker_config = {
      machine_type  = "n1-standard-2"
      num_instances = 10 
      disk_config = {
        boot_disk_size_gb = 100
      }
    }

    autoscaling_config = {
      policy_uri = "projects/${var.project}/locations/${var.region}/autoscalingPolicies/${var.region}-dataeng-${var.env}-policy"
    }

    software_config = {
      image_version = "1.5.30-ubuntu18"
      override_properties = {
        "yarn:yarn.resourcemanager.webapp.methods-allowed"= "GET,POST,DELETE"
        "hive:hive.metastore.warehouse.dir" = "gs://pcln-pl-data-dev-dataproc-staging/hive-warehouse/data"        
      }
      optional_components = [
        "ANACONDA",
        "JUPYTER"       
      ]
    }

    initialization_action = [
      {
        script = "gs://goog-dataproc-initialization-actions-us-east4/cloud-sql-proxy/cloud-sql-proxy.sh",
        timeout_sec = 300
      },
      {
        script = "gs://pcln-pl-data-dev-dataproc-scripts/dataproc_scripts/set_cron_job.sh",
        timeout_sec = 300
      },
    ]

    endpoint_config = {
      enable_http_port_access = true
    }
  }

  # passthrough
  env     = var.env
  region  = var.region
  project = var.project
}