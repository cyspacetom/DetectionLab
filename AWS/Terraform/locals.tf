locals {
  fleet_url        = "https://${aws_instance.logger.public_ip}:8412"
  splunk_url       = "https://${aws_instance.logger.public_ip}:8000"
  ata_url          = "https://${aws_instance.wef.public_ip}"
  guacamole_url    = "http://${aws_instance.logger.public_ip}:8080/guacamole"
  velociraptor_url = "https://${aws_instance.logger.public_ip}:9999"
  ip_whitelist     = [ "${var.my_ip}", "${var.runner_ip}" ]
}
