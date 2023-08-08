include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../..//."
}

inputs = {
  enabled = true

  region      = "us-east-2"
  environment = "test"

  account = "123456789012"

  tags = {
    "Company" = "DeveloperTown"
  }
}
