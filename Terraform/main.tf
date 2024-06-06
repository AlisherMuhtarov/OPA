resource "aws_instance" "uncompliant" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  subnet_id = "subnet-098ab2c379f487d8e"
  key_name = "laptop_key"
  security_groups = ["uncompliant"]
  tags = {
    Name = "tf-example"
  }
}