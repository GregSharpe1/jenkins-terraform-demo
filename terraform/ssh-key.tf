resource "aws_key_pair" "jenkins_demo_ssh_key" {
  key_name = "proxy-deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGYU5VFXYZ51DUrxG1+kSvBJdUe4e1pGLvi8KDMBpFtvjMb5LAVfpmvcXaYBVphSBsy4OgbN09M54Wv3NoPV1oN5FQ0hK8ASpLOtukaDAdMtn44YyDUUSNnXW7DHMqFCuJ5CeVPVj4IxJJ42F01xYwOTj4HQpLze6v2aoRmcPw+DI0pmapG6Ol7KSc9fGGOcd0TLglcQSMXf9fQ4km/3OudvQdx6NAiZgC7s/MVK08FFzauZhBPskHEOLFZh1zmiGW9sS3HD+SKOaaxv6O7hx6G2aC80lDPJYWjxZHoh3BMtwSjdDBveqKE49UrUXpKj5VRVtZu8rJJbcr+Vf5tEtV Jenkins demo key"
}