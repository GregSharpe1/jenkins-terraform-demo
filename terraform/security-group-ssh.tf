resource "aws_security_group" "ssh_traffic" {
  name = "SSH_External"
  vpc_id = "${aws_vpc.jenkins_demo_vpc.id}"
}

resource "aws_security_group_rule" "ssh_traffic_out" {
  security_group_id = "${aws_security_group.ssh_traffic.id}"
  type = "egress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}

resource "aws_security_group_rule" "ssh_traffic_in" {
  security_group_id = "${aws_security_group.ssh_traffic.id}"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}