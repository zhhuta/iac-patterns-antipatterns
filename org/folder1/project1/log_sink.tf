module "zhhuta-logsink" {
    source                 = "../terraform/modules/terraform-gcp-log-sink"
    name                   = "zhhuta-logsink"
    scope                  = "limited"
    project                = project1
    organization           = 12345678
    destination            = "pubsub.googleapis.com/projects/project1/topics/instance-activity"
    # destination            = "storage.googleapis.com/${google_storage_bucket.log-bucket.name}"
    destination            = "bigquery.googleapis.com/projects/project1/datasets/log-dataset"
    #filter                 = ""resource.type = gce_instance AND severity >= WARN" #"resource.type = gce_instance AND severity >= WARN"
    unique_writer_identity = true
}