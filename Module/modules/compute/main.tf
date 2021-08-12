resource "random_id" "instance_id" {
  byte_length = 4
}
resource "google_compute_instance" "vm_instance_public" {
  name         = "${var.name}-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["ssh", "http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  metadata_startup_script = "sudo apt-get update;sudo apt-get install -yq build-essential apache2"
  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.public_subnet.name

    access_config {}
  }
}
