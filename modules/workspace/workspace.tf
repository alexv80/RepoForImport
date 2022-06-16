resource "tfe_workspace" "terraform_cloud_workspace" {
  for_each            = { for workspace in var.workspace_settings : workspace.workspace_name => workspace }
  name                = each.value.workspace_name
  organization        = each.value.organization_name
  execution_mode      = each.value.execution_mode
  agent_pool_id       = each.value.execution_mode == "agent" ? ((each.value.environment == "production") || (each.value.environment == "preprod") ? data.tfe_agent_pool.agent_pool_external.id : data.tfe_agent_pool.agent_pool_internal.id) : null
  auto_apply          = each.value.auto_apply
  speculative_enabled = each.value.speculative_enabled
  ssh_key_id          = data.tfe_ssh_key.bitbucket.id
  tag_names           = [each.value.environment, each.value.component]
  working_directory   = each.value.working_directory
  vcs_repo {
    identifier         = each.value.identifier
    ingress_submodules = each.value.ingress_submodules
    oauth_token_id     = each.value.oauth_token_id
    branch             = each.value.branch
  }
}

data "tfe_ssh_key" "bitbucket" {
  name         = "Bitbucket"
  organization = "Sitecore"
}

data "tfe_agent_pool" "agent_pool_internal" {
  name         = "tfc-agents-dev"
  organization = "Sitecore"
}

data "tfe_agent_pool" "agent_pool_external" {
  name         = "tfc-agents-production"
  organization = "Sitecore"
}
