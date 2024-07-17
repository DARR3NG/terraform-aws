

resource "null_resource" "name" {

  depends_on = [
    module.ec2_public
  ]

  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    private_key = file("private-key/control.pem")

  }


  provisioner "file" {
    source      = "private-key/control.pem"
    destination = "/tmp/control.pem"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400  /tmp/control.pem"
    ]

  }
  provisioner "local-exec" {

    command     = "echo VPC created on `date`  and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files"
    #on_failure = continue

  }


  /*provisioner "local-exec" {

        command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
        working_dir = "local-exec-output-files"
        #on_failure = continue
      when = destroy
    }*/
}