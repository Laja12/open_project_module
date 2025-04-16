variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-084568db4383264d4"
}
 
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.medium"
}
