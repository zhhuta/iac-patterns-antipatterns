module "zhhuta" {
  source = "git::https://github.com/pcln/terraform-gcp-bucket.git//modules/bucket_advanced_tfo"

  # bucket
  name = "zhhuta"
  team = "fly-supply"
  
  objectViewer = [
    "zhhuta@gmail.com",
  ]

  # passthrough
  project = var.project

  lifecycle_rules = [{
    action = {
      type = "true"
    }
    condition = {
      age = 30
    }
  }]
}