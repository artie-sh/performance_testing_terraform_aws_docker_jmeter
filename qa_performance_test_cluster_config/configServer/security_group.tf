resource "aws_security_group" "qa_load_test" {

  name = "qa_load_test_security_group"
  tags {
    Name = "qa_load_test_security_group"
  }
  vpc_id = "${aws_vpc.qa_load_test_vpc.id}"

	ingress {
	  from_port   = 22
	  to_port     = 22
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
	  from_port   = 80
	  to_port     = 80
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
	  from_port   = 1099
	  to_port     = 1099
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
	  from_port   = 50000
	  to_port     = 50000
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
	  from_port   = 60000
	  to_port     = 60000
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
	}
}