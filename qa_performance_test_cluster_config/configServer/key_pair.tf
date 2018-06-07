resource "aws_key_pair" "qa_load_keypair" {
	provider = 		"aws"
	key_name   = 	"qa_load_keypair"
	public_key = 	"${file("../qa_load_keypair.pub")}"
}
