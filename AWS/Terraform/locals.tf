locals {
  ip_whitelist     = ["${var.my_ip}/32", "${var.runner_ip}/32"]
}
