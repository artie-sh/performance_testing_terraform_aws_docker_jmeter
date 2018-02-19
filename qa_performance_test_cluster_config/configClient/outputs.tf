output "aws_instance_ip" {
  value = "${aws_instance.client.public_ip}"
}