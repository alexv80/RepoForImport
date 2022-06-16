variable "workspace_settings" {
  type = list(object({
    workspace_name      = string
    organization_name   = string
    execution_mode      = string
    agent_pool_id       = optional(string)
    auto_apply          = string
    speculative_enabled = bool
    working_directory   = string
    identifier          = string
    ingress_submodules  = bool
    oauth_token_id      = string
    environment         = string
    component           = string
  }))
  description = "Workspace set of settings"
}
