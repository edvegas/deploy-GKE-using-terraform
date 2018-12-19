variable project_id {
  description = "Google Cloud project ID"
}

variable gc_zone {
  description = "Google Cloud zone for cluster"
  default     = "europe-west1-b"
}

variable cluster_name {
  description = "Google Kubernetes Cluster name"
  default     = "cluster-1"
}

variable node_count {
  description = "Default amount of nodes in cluster"
  default     = 3
}

variable disk_size_in_gb {
  description = "Disk size of each node"
  default     = 30
}

variable machine {
  description = "Google Cloud Machine type"
  default     = "n1-standard-1"
}
