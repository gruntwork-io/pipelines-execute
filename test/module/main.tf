# Define the Terraform provider and required version
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Configure the Random provider
provider "random" {}

# Define the input variable for the name
variable "name" {
  type        = string
  description = "The name to be concatenated with the random ID"
}

# Generate a random ID
resource "random_id" "this" {
  byte_length = 8
}

# Output the concatenation of the name input and the random ID
output "name_with_random_id" {
  value = "${var.name}-${random_id.this.hex}"
}

output "name_only" {
  value = var.name
}
