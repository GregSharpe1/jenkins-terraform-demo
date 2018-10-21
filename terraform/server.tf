resource "aws_instance" "jenkins_demo_instance" {
  count = 1
  ami                         = "${lookup(var.ami_ubuntu, var.aws_default_region)}"
  instance_type               = "t3.nano"
  associate_public_ip_address = true
  source_dest_check           = false
  subnet_id                   = "${aws_subnet.jenkins_demo_subnet.id}"
  key_name                    = "${aws_key_pair.jenkins_demo_ssh_key.id}"

  vpc_security_group_ids = [
    "${aws_security_group.ssh_traffic.id}",
    "${aws_security_group.http_traffic.id}",
    "${aws_security_group.https_traffic.id}",
  ]

  root_block_device = {
    delete_on_termination = true
  }

  tags = {
    Name = "JenkinsDemo${format("%02d", count.index + 1)}"
    Owner = "me@gregsharpe.co.uk"
  }
}

resource "aws_eip" "jenkins_demo_eip" {
  vpc      = true
  instance = "${aws_instance.jenkins_demo_instance.id}"
}