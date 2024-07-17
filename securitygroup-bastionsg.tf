#security group for public bastion host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "public-bastion-sg"
  description = "Security Group with SSH port open for evrybody (IPV4 cidr), egress ports are all opan"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  # Egress Ruels - all-all open

  egress_rules = ["all-all"]
  tags         = local.common_tags

}


