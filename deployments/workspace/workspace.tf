terraform {
  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]

  required_providers {
    tfe = {
      version = "~> 0.31.0"
    }
  }

  cloud {
    organization = "Sitecore"
    workspaces {
      name = "Terraform-Cloud-Workspaces"
    }
  }
}

module "tfc_workspaces" {
  source             = "../../modules/workspace"
  workspace_settings = var.workspace_settings
}
