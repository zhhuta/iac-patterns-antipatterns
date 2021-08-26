module "blabla" {
    source                 = "../terraform/modules/terraform-gcp-log-sink"
    name                   = "blabla"
    scope                  = "project" or "organization"
    project                = `<your project id>`
    organization           = `<your organization id>`
    destination            = "pubsub.googleapis.com/projects/<your project id>/topics/instance-activity"
    # destination            = "storage.googleapis.com/${google_storage_bucket.log-bucket.name}"
    # destination            = "bigquery.googleapis.com/projects/<your project id>/datasets/<your dataset>"
    filter                 = "resource.type = gce_instance AND severity >= WARN"
    unique_writer_identity = true
}

data "google_billing_account" "account" {
  billing_account = "000000-0000000-0000000-000000"
}

resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id
  display_name = "Example Billing Budget"
  amount {
    specified_amount {
      currency_code = "USD"
      units = "100000"
    }
  }
  threshold_rules {
      threshold_percent =  0.5
  }
}