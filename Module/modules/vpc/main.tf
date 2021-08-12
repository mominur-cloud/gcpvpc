resource "google_compute_network" "vpc" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  project                 =var.project

}
resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.name}-public-subnet"
  ip_cidr_range = var.public_subnet_cidr
  network       = google_compute_network.vpc.name
  region        = var.region
  project       = var.project
}
resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.name}-private-subnet"
  ip_cidr_range = var.private_subnet_cidr
  network       = google_compute_network.vpc.name
  region        = var.region
  project       = var.project
}
#Allow SSH
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.name}-fw-allow-ssh"
  network = google_compute_network.vpc.name
  project = var.project
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
}

# allow http traffic
resource "google_compute_firewall" "allow-http" {
  name    = "${var.name}-fw-allow-http"
  network = google_compute_network.vpc.name
  project = var.project
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"]
}
# allow https traffic
resource "google_compute_firewall" "allow-https" {
  name    = "${var.name}-fw-allow-https"
  network = google_compute_network.vpc.name
  project = var.project
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["https"]
}

