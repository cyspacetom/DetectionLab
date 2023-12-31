variable "custom-tags" {
  type        = map(string)
  description = "Optional mapping for additional tags to apply to all related AWS resources"
  default     = {}
}

variable "region" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs"
  default     = ""
}

variable "instance_name_prefix" {
  description = "Optional string to prefix at the front of instance names in case you need to run multiple DetectionLab environments in the same AWS account"
  default     = ""
}

variable "availability_zone" {
  description = "https://www.terraform.io/docs/providers/aws/d/availability_zone.html"
  default     = ""
}

variable "public_key_name" {
  description = "A name for AWS Keypair to use to auth to logger. Can be anything you specify."
  default     = "id_logger"
}

# Public key string, generated locally. For access to Logger.

variable "public_key" {
  description = "Public Key for access to Logger host - passed into Terraform through GitHub Secrets"
  type        = string
  default     = ""
}

variable "my_ip" {
  description = "My own public IP fetched from an environment variable, will be added to IP whitelist - Must be formatted in CIDR notation. eg 192.168.0.10/32"
  type        = string
  default     = ""
}

variable "runner_ip" {
  description = "The Github Runner IP, will be added to IP whitelist - Must be formatted in CIDR notation. eg 192.168.0.10/32"
  type        = string
  default     = ""
}

variable "external_dns_servers" {
  description = "Configure lab to allow external DNS resolution"
  type        = list(string)
  default     = ["8.8.8.8"]
}

# Build flags - For troubleshooting, allows to build one instance at a time

variable "build_dc" {
  description = "Flag to build DC instance"
  type        = bool
  default     = false
}

variable "build_wef" {
  description = "Flag to build WEF instance"
  type        = bool
  default     = false
}

variable "build_win10" {
  description = "Flag to build WIN10 instance"
  type        = bool
  default     = false
}

variable "build_logger" {
  description = "Flag to build Logger instance"
  type        = bool
  default     = true
}

# Use Data Sources to resolve the AMI-ID for the Ubuntu 20.04 AMI
data "aws_ami" "logger_ami" {
  count  = var.logger_ami == "" ? 1 : 0
  owners = ["635547317643"]

  filter {
    name   = "name"
    values = ["Maximumpigs/Linux/DetectionLab_Logger"]
  }
}

# Use Data Sources to resolve the AMI-ID for the pre-built DC host
data "aws_ami" "dc_ami" {
  count  = var.dc_ami == "" ? 1 : 0
  owners = ["635547317643"]

  filter {
    name   = "name"
    values = ["Maximumpigs/Windows/DetectionLab_DC"]
  }
}

# Use Data Sources to resolve the AMI-ID for the pre-built WEF host
data "aws_ami" "wef_ami" {
  count       = var.wef_ami == "" ? 1 : 0
  owners      = ["635547317643"]
  most_recent = true

  filter {
    name   = "name"
    values = ["Maximumpigs/Windows/DetectionLab_WEF"]
  }
}

# Use Data Sources to resolve the AMI-ID for the pre-built Win10 host
data "aws_ami" "win10_ami" {
  count       = var.win10_ami == "" ? 1 : 0
  owners      = ["635547317643"]
  most_recent = true

  filter {
    name   = "name"
    values = ["Maximumpigs/Windows/DetectionLab_Win10"]
  }
}

# If you are building your own AMIs, replace the default values below with
# the AMI IDs
variable "logger_ami" {
  type    = string
  default = ""
}

variable "dc_ami" {
  type    = string
  default = ""
}

variable "wef_ami" {
  type    = string
  default = ""
}

variable "exchange_ami" {
  type    = string
  default = ""
}

variable "win10_ami" {
  type    = string
  default = ""
}
