resource "aws_vpc" "jenkins_demo_vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "Jenkins demo VPC"
  }
}