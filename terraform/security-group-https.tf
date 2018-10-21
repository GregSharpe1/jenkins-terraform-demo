resource "aws_security_group" "https_traffic" {
  name = "HTTPS External"
  vpc_id = "${aws_vpc.jenkins_demo_vpc.id}"
}

resource "aws_security_group_rule" "https_traffic_out" {
  security_group_id = "${aws_security_group.https_traffic.id}"
  type = "egress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}

resource "aws_security_group_rule" "https_traffic_in" {
  security_group_id = "${aws_security_group.https_traffic.id}"
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}