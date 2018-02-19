
module "ireland" {
	source = "./configClient"
	aws_ami = "${var.aws_amis["ireland"]}"
	region_name = "${var.aws_regions["ireland"]}"
	aws_instance_name = "${var.instance_names["ireland"]}"
	docker_image = "${var.docker_images["jmeter_client"]}"
	serverIPs = "${module.n_virginia.aws_instance_ip},${module.ohio.aws_instance_ip},${module.n_california.aws_instance_ip},${module.oregon.aws_instance_ip}"
	test_file = "load.jmx"
}



module "n_virginia" {
	source = "./configServer"
	region_name = "${var.aws_regions["n_virginia"]}"
	aws_ami = "${var.aws_amis["n_virginia"]}"
	aws_instance_name = "${var.instance_names["n_virginia"]}"
	docker_image = "${var.docker_images["jmeter_server"]}"
}


module "ohio" {
	source = "./configServer"
	aws_ami = "${var.aws_amis["ohio"]}"
	region_name = "${var.aws_regions["ohio"]}"
	aws_instance_name = "${var.instance_names["ohio"]}"
	docker_image = "${var.docker_images["jmeter_server"]}"
}


module "n_california" {
	source = "./configServer"
	aws_ami = "${var.aws_amis["n_california"]}"
	region_name = "${var.aws_regions["n_california"]}"
	aws_instance_name = "${var.instance_names["n_california"]}"
	docker_image = "${var.docker_images["jmeter_server"]}"
}


module "oregon" {
	source = "./configServer"
	aws_ami = "${var.aws_amis["oregon"]}"
	region_name = "${var.aws_regions["oregon"]}"
	aws_instance_name = "${var.instance_names["oregon"]}"
	docker_image = "${var.docker_images["jmeter_server"]}"
}
