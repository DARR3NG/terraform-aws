variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}


variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2"
  type        = string
  default     = "control"

}


variable "private_instance_count" {
  description = "AWS EC2 Private Instances Count"
  type        = number
  default     = 1

}