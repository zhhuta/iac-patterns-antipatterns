module "zhhuta-n1" {
  source = "git::https://github.com/pcln/terraform-gcp-bucket.git//modules/bucket_advanced_tfo"

  # bucket
  name = "zhhuta-n1"
  team = "fly-supply"
  
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