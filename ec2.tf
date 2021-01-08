resource "aws_key_pair" "mykp" {
  key_name = "mykp"
  public_key = file(var.ssh_key)

}

resource "aws_instance" "web_inst" {
    ami = data.aws_ami.my_image.id
    instance_type = var.inst_type[1]
    key_name = aws_key_pair.mykp.key_name
    security_groups = [aws_security_group.websg.id]
    subnet_id = aws_default_subnet.defsub.id
    associate_public_ip_address = true


    provisioner "file" {
      source = var.script
      destination = "/tmp/adhoc.sh"

      connection {
        type = "ssh"
        user = var.instance_user
        timeout = "1m"
        host = aws_instance.web_inst.public_ip
        private_key = file(var.ssh_priv_key)
      }
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/adhoc.sh",
        "sudo /tmp/adhoc.sh",
      ]

      connection {
        type = "ssh"
        user = var.instance_user
        host = aws_instance.web_inst.public_ip
        private_key = file(var.ssh_priv_key)
      }
    }

  tags = {
    Name = "web_inst"
  }
}
