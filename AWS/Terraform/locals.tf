locals {
  fleet_url        = "https://${aws_instance.logger[0].public_ip}:8412"
  splunk_url       = "https://${aws_instance.logger[0].public_ip}:8000"
  ata_url          = "https://${aws_instance.wef[0].public_ip}"
  guacamole_url    = "http://${aws_instance.logger[0].public_ip}:8080/guacamole"
  velociraptor_url = "https://${aws_instance.logger[0].public_ip}:9999"
  ip_whitelist     = ["${var.my_ip}/32", "${var.runner_ip}/32"]
}
