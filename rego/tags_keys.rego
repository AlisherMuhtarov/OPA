package aws_instance_compliance

default allow = false

# Deny creation of AWS instances with the specified configuration
deny {
    input.resource == "aws_instance"
    input.action == "create"
    input.parameters.ami == "ami-00beae93a2d981137"
    input.parameters.instance_type == "t2.micro"
    input.parameters.subnet_id == "subnet-098ab2c379f487d8e"
    input.parameters.key_name == "laptop_key"
    input.parameters.security_groups[_] == "uncompliant"
    input.parameters.tags.Name == "tf-example"
}

# Allow all other actions
allow {
    not deny
}
