# Define terragrunt configuration
terraform {
  source = "../../module"
}

inputs = {
  name = "example-name"
}
