terraform {
  # Require Terraform version 1.1.x
  required_version = "~> 1.1.0"

  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]

  required_providers {
    tfe = {
      version = "~> 0.31.0"
    }
  }
}
