#security group for public bastion host
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "private-sg"
  description = "Security Group with SSH port open for evrybody entire VPC Block, egress ports are all opan"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]

  # Egress Ruels - all-all open

  egress_rules = ["all-all"]
  tags         = local.common_tags

}


