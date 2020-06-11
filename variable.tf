variable "project" {
  default = "poetic-hexagon-252009"
}

variable "region" {
  default = "europe-west"
}

variable "cluster_name" {
  default = "eikos-cluster"
}

variable "cluster_location" {
  default = "europe-west1-b"
}

variable "cluster_k8s_version" {
  default = "1.13.7-gke.24"
}

variable "initial_node_count" {
  default = 2
}

variable "autoscaling_min_node_count" {
  default = 1
}

variable "autoscaling_max_node_count" {
  default = 2
}

variable "disk_size_gb" {
  default = 50
}

variable "disk_type" {
  default = "pd-standard"
}

variable "machine_type" {
  default = "n1-standard-1"
}
