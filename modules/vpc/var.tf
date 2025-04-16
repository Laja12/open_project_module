variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}
 
variable "public_subnet_a_cidr" {
  description = "The CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}
 
variable "public_subnet_b_cidr" {
  description = "The CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}
 
variable "availability_zone_a" {
  description = "The availability zone for the first public subnet"
  default     = "us-east-1a"
}
 
variable "availability_zone_b" {
  description = "The availability zone for the second public subnet"
  default     = "us-east-1b"
}
