output "nat_a_public_ip" {
  value = module.nat_a.public_ip
}

output "nat_a_public_dns" {
  value = module.nat_a.public_dns
}

output "nat_c_public_ip" {
  value = module.nat_c.public_ip
}

output "nat_c_public_dns" {
  value = module.nat_c.public_dns
}
