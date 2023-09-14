resource "aws_key_pair" "mtc_auth" {
  key_name   = "mtckey"
  public_key = file("/mnt/workspace/mtc.pub")
}

resource "aws_instance" "dev_node" {
  instance_type          = "t3.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.mtc_auth_id
  vpc_security_group_ids = var.security_group_id
  subnet_id              = var.subnet.id
  user_data              = file("${path.module}/userdata.tpl")

  tags = {
    Name = "dev-node"
  }

  # provisioner "local-exec" {
  #   command = templatefile("${var.host_os}-ssh-config.tpl", {
  #     hostname     = self.public_ip,
  #     user         = "ubuntu",
  #     identityfile = "~/.ssh/mtckey"
  #   })
  #   interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  # }
}