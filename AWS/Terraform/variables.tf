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

# If you are passing in a public key as a string through the public_key variable - leave this, and the null file as is.
variable "public_key_path" {
  description = "Path to the public key to be loaded into the logger authorized_keys file"
  type        = string
  default     = "/null.pub"
}

variable "public_key" {
  description = "Public Key for access to Logger host - passed into Terraform through GitHub Secrets"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Path to the private key to use to authenticate to logger."
  type        = string
  default     = "/home/username/.ssh/id_logger"
}

/*
variable "ip_whitelist" {
  description = "A list of CIDRs that will be allowed to access the EC2 instances"
  type        = list(string)
  default     = [""]
}
*/

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

# Use Data Sources to resolve the AMI-ID for the Ubuntu 20.04 AMI
data "aws_ami" "logger_ami" {
  count  = var.logger_ami == "" ? 1 : 0
  owners = ["505638924199"]

  filter {
    name   = "name"
    values = ["detectionlab-logger"]
  }
}

# Use Data Sources to resolve the AMI-ID for the pre-built DC host
data "aws_ami" "dc_ami" {
  count  = var.dc_ami == "" ? 1 : 0
  owners = ["505638924199"]

  filter {
    name   = "name"
    values = ["detectionlab-dc"]
  }
}

# Use Data Sources to resolve the AMI-ID for the pre-built WEF host
data "aws_ami" "wef_ami" {
  count       = var.wef_ami == "" ? 1 : 0
  owners      = ["505638924199"]
  most_recent = true

  filter {
    name   = "name"
    values = ["detectionlab-wef"]
  }
}

# Use Data Sources to resolve the AMI-ID for the pre-built Win10 host
data "aws_ami" "win10_ami" {
  count       = var.win10_ami == "" ? 1 : 0
  owners      = ["505638924199"]
  most_recent = true

  filter {
    name   = "name"
    values = ["detectionlab-win10"]
  }
}

# If you are building your own AMIs, replace the default values below with
# the AMI IDs
variable "logger_ami" {
  type    = string
  default = "ami-0f1bbc856e32ea598"
}

variable "dc_ami" {
  type    = string
  default = "ami-0b4e4f3e2212d8c23"
}

variable "wef_ami" {
  type    = string
  default = "ami-00d4e238e07aca8ac"
}

variable "exchange_ami" {
  type    = string
  default = ""
}

variable "win10_ami" {
  type    = string
  default = "ami-0345e1c53383281bb"
}
