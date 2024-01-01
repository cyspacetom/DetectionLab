output "region" {
  value = data.aws_region.current.name
}

output "logger_public_ip" {
  value = length(aws_instance.logger) > 0 ? aws_instance.logger[0].public_ip : null
}

output "logger_ssh_access" {
  value = length(aws_instance.logger) > 0 ? "ssh vagrant@${aws_instance.logger[0].public_ip} (password=vagrant)" : null
}

output "dc_public_ip" {
  value = length(aws_instance.dc) > 0 ? aws_instance.dc[0].public_ip : null
}

output "wef_public_ip" {
  value = length(aws_instance.wef) > 0 ? aws_instance.wef[0].public_ip : null
}

output "win10_public_ip" {
  value = length(aws_instance.win10) > 0 ? aws_instance.win10[0].public_ip : null
}

output "fleet_url" {
  value = length(aws_instance.logger) > 0 ? "https://${aws_instance.logger[0].public_ip}:8412" : null
}

output "splunk_url" {
  value = length(aws_instance.logger) > 0 ? "https://${aws_instance.logger[0].public_ip}:8000" : null
}

output "guacamole_url" {
  value = length(aws_instance.logger) > 0 ? "http://${aws_instance.logger[0].public_ip}:8080/guacamole" : null
}

output "velociraptor_url" {
  value = length(aws_instance.logger) > 0 ? "https://${aws_instance.logger[0].public_ip}:9999" : null
}

output "ata_url" {
  value = length(aws_instance.wef) > 0 ? "https://${aws_instance.wef[0].public_ip}" : null
}