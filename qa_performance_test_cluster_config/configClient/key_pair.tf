resource "aws_key_pair" "qa_load_keypair" {
	provider = 		"aws"
	key_name   = 	"qa_load_keypair"
	public_key = 	"ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAraBG2X8UBEYnXMq+bO+sVt4JlYO/SbmrLjE8eVyI3yQLfR9zoB4jQJuG43ZTrEY/VktlKZx6szVZwPPYMKA5T3ijE2MAlgG3+vBX9y8c6UwuVkARfAItaLG1ADyNiaz3JJZiDzwQg4n35xZ9jPTx9Ad3SQ6kQf1Qz8+bO7GKbMc= ashendri@wro051"
}