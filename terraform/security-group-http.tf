resource "aws_security_group" "http_traffic" {
  name = "HTTP_External"
  vpc_id = "${aws_vpc.jenkins_demo_vpc.id}"
}

resource "aws_security_group_rule" "http_traffic_out" {
  security_group_id = "${aws_security_group.http_traffic.id}"
  type = "egress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}

resource "aws_security_group_rule" "http_traffic_in" {
  security_group_id = "${aws_security_group.http_traffic.id}"
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}