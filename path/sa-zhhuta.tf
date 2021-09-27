#service.account.tf.jinja1
module "zhhuta-sa" {
  source = "git::https://github.com/pcln/terraform-gcp-service_account.git//modules/service_account"

  project      = var.project
  account_id   = "zhhuta-sa"
  display_name = "zhhuta-sa"
  description  = "New service account for zhhuta"
}