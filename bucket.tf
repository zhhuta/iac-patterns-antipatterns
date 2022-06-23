module "zhhuta-n1" {
  source = "git::https://github.com/zhhuta/terraform-gcp.git//modules/bucket_advanced"

  # bucket
  name = "zhhuta-n1"
  team = "zhhuta_team"
  
  objectViewer = [
    "zhhuta@gmail.com",
  ]

  # passthrough
  project = var.project

  lifecycle_rules = [{
    action = {
      type = "1"
    }
    condition = {
      age = 10
    }
  }]
}