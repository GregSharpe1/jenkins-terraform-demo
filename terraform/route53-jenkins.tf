resource "aws_route53_record" "jenkins_demo_public" {
  zone_id = "${var.gregsharpe_route53_zone_public}"
  name = "demo.gregsharpe.co.uk"
  type = "A"
  ttl = "300"
  records = ["${aws_eip.jenkins_demo_eip.public_ip}"]
}