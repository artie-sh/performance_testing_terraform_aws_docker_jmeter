output "aws_instance_ip" {
  value = "${aws_instance.server.public_ip}"
}

