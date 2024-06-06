package main

deny[msg] {
    resource := input.resource
    not has_tags(resource)
    msg := "EC2 instance must have tags defined"
}

deny[msg] {
    resource := input.resource
    not has_key_name(resource)
    msg := "EC2 instance must have a key name defined"
}

has_tags(resource) {
    resource["type"] == "aws_instance"
    resource["attr"]["tags"] != null
}

has_key_name(resource) {
    resource["type"] == "aws_instance"
    resource["attr"]["key_name"] != null
}
