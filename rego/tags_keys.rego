package terraform.deny_no_tags

import input.attributes.planned_values.root_module.resources

deny[msg] {
    resource := resources[_]
    resource.address == "aws_instance.uncompliant"
    not has_tags(resource.values)
    msg := sprintf("Resource %v must have tags defined.", [resource.name])
}

has_tags(tags) {
    tags != null
    count(tags) > 0
}
