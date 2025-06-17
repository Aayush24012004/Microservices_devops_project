variable "home_ip" {
  description = "Your home public IP address"
  type        = string
  default     = "203.0.113.10/32"
}

variable "office_ip" {
  description = "Your office public IP address"
  type        = string
  default     = "198.51.100.20/32"
}

variable "allowed_ips" {
  description = "List of allowed IPs (home + office)"
  type        = list(string)
  default     = ["122.160.142.133/32", "49.36.179.187/32"]
}
variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "key_name" {
  description = "Key Pair"
  type        = string
}

variable "volume_size" {
  description = "Volume size"
  type        = string
}

variable "region_name" {
  description = "AWS Region"
  type        = string
}

variable "server_name" {
  description = "EC2 Server Name"
  type        = string
}
variable "availability_zones" {
  type = list
  default = ["us-east-1a"]
}