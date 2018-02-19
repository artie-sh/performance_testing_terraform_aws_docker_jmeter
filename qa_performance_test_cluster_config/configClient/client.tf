resource "aws_instance" "client" {

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

  
  provisioner "file" {
    source      = "../${var.test_file}"
    destination = "/home/ec2-user/${var.test_file}"
	
	connection {
      user = "ec2-user"
      private_key = "${file("../qa_load_keypair")}"
      host = "${self.public_ip}"
    }
  }
  
  provisioner "remote-exec" {
	inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
	  "sudo service docker start",
	  "sudo docker run -dit --name jmeter_client -p 60000:60000 ${var.docker_image} /bin/bash",
	  "sudo docker cp ${var.test_file} jmeter_client:/${var.test_file}",
	  "sudo docker exec -it jmeter_client /jmeter/apache-jmeter-3.3/bin/jmeter -n -t ${var.test_file} -Djava.rmi.server.hostname=${self.public_ip} -Dclient.rmi.localport=60000 -R${var.serverIPs} -l '/report.jtl'",
	  "sudo docker cp jmeter_client:/report.jtl report.jtl"
    ]
	connection {
      user = "ec2-user"
      private_key = "${file("../qa_load_keypair")}"
      host = "${self.public_ip}"
    }
  }
  
    provisioner "local-exec" {
    command = "scp -i ../qa_load_keypair ec2-user@${self.public_ip}:/home/ec2-user/report.jtl ../report.jtl"
  }
  
}







