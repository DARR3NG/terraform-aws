module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "loadbalancer-sg"
  description = "Security Group with HTTP port open for entire internet (IPV4 cidr), egress ports are all opan"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]



  # Egress Ruels - all-all open

  egress_rules = ["all-all"]
  tags         = local.common_tags



    ingress_with_cidr_blocks =[
         {
    from_port = 81
    to_port = 81
    protocol = 6
    description = "Allow Port 81 from internet"
    cidr_blocks = "0.0.0.0/0"
  },
    ]

}
