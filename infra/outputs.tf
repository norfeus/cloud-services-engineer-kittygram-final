output "external_ip" {
  description = "The external IP address of the VM"
  value       = yandex_compute_instance.vm_1.network_interface[0].nat_ip_address
}