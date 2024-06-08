package terraform.aws_instance_tag_policy

import input as tfplan

# Deny creation of AWS instances if they don't have the required tag "env = dev"
deny[msg] {
    resource := tfplan.resource_changes[_]
    resource.address == "aws_instance.uncompliant"
    action := resource.change.actions[_]
    action == "create"
    not tfplan.configuration.root_module.resources[_].expressions.tags.constant_value.env == "dev"
    msg := sprintf("Instance '%v' does not have the required tag 'env = dev'", [resource.name])
}
