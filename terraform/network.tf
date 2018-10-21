resource "aws_subnet" "jenkins_demo_subnet" {
  vpc_id = "${aws_vpc.jenkins_demo_vpc.id}"
  cidr_block = "${var.frontend_subnet_cidr_a}"
  availability_zone = "${var.aws_default_region}${var.aws_region_zone_a}"
}

resource "aws_internet_gateway" "jenkins_demo_gateway" {
  vpc_id = "${aws_vpc.jenkins_demo_vpc.id}"
}

resource "aws_route_table" "jenkins_demo_route_table" {
  vpc_id = "${aws_vpc.jenkins_demo_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.jenkins_demo_gateway.id}"
  }
}

resource "aws_route_table_association" "jenkins_demo_subnet_frontend_a" {
  subnet_id = "${aws_subnet.jenkins_demo_subnet.id}"
  route_table_id = "${aws_route_table.jenkins_demo_route_table.id}"
}