#service.account.tf.jinja1
module "Hello World" {
  source = "git::https://github.com/pcln/terraform-gcp-service_account.git//modules/service_account"

  project      = var.project
  account_id   = "Hello World"
  display_name = "Hello World"
  description  = "Hello World"
}