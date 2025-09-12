output "test_security_group_id" {
  description = "ID of the security group created for testing."
  value       = module.web_server_sg.security_group_id
}

output "test_security_group_name" {
  description = "Name of the security group created for testing."
  value       = module.web_server_sg.security_group_name
}
