
module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  count   = var.private_instance_count


  name          = "${var.environment}-vm"
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring = true
  subnet_id = module.vpc.private_subnets[count.index]
  user_data = file("${path.module}/apache-install.sh")

  vpc_security_group_ids = [module.private_sg.security_group_id]
  tags                   = local.common_tags

  depends_on = [
    module.vpc

  ]
}