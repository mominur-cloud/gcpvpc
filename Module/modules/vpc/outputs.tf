output "network" {
  description = "A reference (self_link) to the VPC network"
  value       = google_compute_network.vpc.self_link
}

