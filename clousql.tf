locals {

  database_flags = [
    { name = "local_infile", value = "off" },
    { name = "log_bin_trust_function_creators", value = "on" },
  ]
  disk_size = 10
}

module "zhhuta-cloudsql" {


  source = "git::https://github.com/zhhuta/terraform-gcp-cloudsql.git//modules/mysql"

  name                = "zhhuta-master"
  database_version    = "MYSQL_8"
  team                = "data_eng"
  deletion_protection = true

  settings = {
    tier                 = "something"
    disk_size            = local.disk_size
    availability_type    = "ZONAL"
    ip_configuration     = { ipv4_enabled = false }
    backup_configuration = { enabled = true, binary_log_enabled = true, start_time = "20:55" }
    location_preference  = { zone = "us-east1-a" }
    database_flags       = local.database_flags
  }

  ]

  # pass through
  project = var.project
  region  = var.region
  env     = var.env

}