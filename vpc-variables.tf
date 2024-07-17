variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "vpc"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}



variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]

}

variable "database_subnets" {
  description = "VPC Database Subnets"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable nat Gateway?"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Single nat gateway?"
  type        = bool
  default     = false
}

variable "create_database_subnet_group" {
  description = "create_database_subnet_group?"
  type        = bool
  default     = true

}
variable "create_database_subnet_route_table" {
  description = "create_database_subnet_route_table?"
  type        = bool
  default     = true

}