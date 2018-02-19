variable "aws_amis" {
	type = "map"
	default = {
		"n_virginia" = "ami-a4c7edb2"
		"ohio" = "ami-8a7859ef"
		"n_california" = "ami-327f5352"
		"oregon" = "ami-6df1e514"
		"ireland" = "ami-d7b9a2b1"
	}
}


variable "aws_regions" {
	type = "map"
	default = {
		"n_virginia" = "us-east-1"
		"ohio" = "us-east-2"
		"n_california" = "us-west-1"
		"oregon" = "us-west-2"
		"ireland" = "eu-west-1"
	}
}


variable "instance_names" {
	type = "map"
	default = {
		"n_virginia" = "qa_load_server_n_virginia"
		"ohio" = "qa_load_server_ohio"
		"n_california" = "qa_load_server_n_california"
		"oregon" = "qa_load_server_oregon"
		"ireland" = "qa_load_client_ireland"
	}
}

variable "docker_images" {
	type = "map"
	default = {
		"jmeter_client" = "artiesh87/jmeter_client"
		"jmeter_server" = "artiesh87/jmeter_server"
	}
}
