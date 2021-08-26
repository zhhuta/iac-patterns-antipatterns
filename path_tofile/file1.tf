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