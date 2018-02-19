data "aws_availability_zones" "available" {}


resource "aws_vpc" "qa_load_test_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags {
    Name = "qa_load_test_vpc"
  }
}


resource "aws_subnet" "qa_load_test_subnet" {
  vpc_id            = "${aws_vpc.qa_load_test_vpc.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags {
    Name            = "qa_load_test_subnet"
  }
}


resource "aws_internet_gateway" "qa_load_test_internet_gateway" {
  vpc_id            = "${aws_vpc.qa_load_test_vpc.id}"
  tags {
    Name            = "qa_load_test_internet_gateway"
  }
}


resource "aws_route_table" "qa_load_test_route_table" {
  vpc_id            = "${aws_vpc.qa_load_test_vpc.id}"
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = "${aws_internet_gateway.qa_load_test_internet_gateway.id}"
  }
  tags {
    Name            = "qa_load_test_route_table"
  }
}


resource "aws_route_table_association" "qa_load_test_route_table_association" {
  subnet_id         = "${aws_subnet.qa_load_test_subnet.id}"
  route_table_id    = "${aws_route_table.qa_load_test_route_table.id}"
}