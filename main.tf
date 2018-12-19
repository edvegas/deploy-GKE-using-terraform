resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  zone               = "${var.gc_zone}"
  initial_node_count = "${var.node_count}"
  project            = "${var.project_id}"

  master_auth {
    username = ""
    password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    
    disk_size_gb = "${var.disk_size}"
    machine_type = "${var.machine}"


    tags = ["k8s"]
  }
}

resource "google_compute_firewall" "default" {
  name    = "k8s-allow"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }

  source_tags = ["k8s"]
}


# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

