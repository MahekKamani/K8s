provider "google" {
  project = "terraform-gke-test-453503"
  region  = "us-central1"
}

data "google_client_config" "default" {}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 24.1"

  project_id          = "terraform-gke-test-453503"
  name                = "assignment-3"
  region              = "us-central1"
  zones               = ["us-central1-c"]
  network             = "default"
  subnetwork          = "default"
  ip_range_pods       = ""
  ip_range_services   = ""

  node_pools = [
    {
      name            = "default-node-pool"
      machine_type    = "e2-medium"
      min_count       = 1
      max_count       = 1
      disk_size_gb    = 10
      auto_upgrade    = true
      service_account = "722347196465-compute@developer.gserviceaccount.com"
    }
  ]
}