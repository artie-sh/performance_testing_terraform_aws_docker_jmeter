resource "aws_instance" "server" {

  tags {
    Name = "${var.aws_instance_name}"
  }
  
  provider = "aws"
  ami           = "${var.aws_ami}"
  instance_type = "t2.micro"
  associate_public_ip_address = true 
  vpc_security_group_ids = ["${aws_security_group.qa_load_test.id}"]
  subnet_id = "${aws_subnet.qa_load_test_subnet.id}"
  key_name = "${aws_key_pair.qa_load_keypair.key_name}"

  provisioner "remote-exec" {
	inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
	  "sudo service docker start",
	  "sudo docker run -dit -e LOCALIP=${self.public_ip} -p 1099:1099 -p 50000:50000 ${var.docker_image} /bin/bash"
    ]
	connection {
      user = "ec2-user"
      private_key = "${file("../qa_load_keypair")}"
      host = "${self.public_ip}"
    }
  }
  
}