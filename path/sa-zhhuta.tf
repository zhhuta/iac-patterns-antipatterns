module "zhhuta-log-sink" {
    source                 = "../terraform/modules/terraform-gcp-log-sink"
    name                   = "zhhuta-log-sink"
    scope                  = "my"
    project                = project-a
    organization           = 12345678
    destination            = "pubsub.googleapis.com/projects/project-a/topics/instance-activity"
    # destination            = "storage.googleapis.com/${google_storage_bucket.log-bucket.name}"
    destination            = "bigquery.googleapis.com/projects/project-a/datasets/boom"
    #filter                 = "resource.type = gce_instance AND severity >= WARN" #"resource.type = gce_instance AND severity >= WARN"
    unique_writer_identity = true
}