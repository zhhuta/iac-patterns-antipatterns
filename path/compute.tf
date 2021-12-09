
module "zhhuta-server" {
  source       = "git::https://github.com/zhhuta/terraform-gcp.git//modules/compute_instance"
  module_count = 1

  name        = "zhhuta-server"
  
  disk_size    = "50"
  image        = "projects/infra-nonprod/global/images/debian"
  machine_type = "n1-standart"
  servertype   = "my"
  subnet_type  = "new"
  team         = "clouddev"

  

  labels = {
    owner = "clouddev-${var.env}"
  }

  tags = [
    "{tags}",
  ]

}