variable "tfc_agent_token" {
  type      = string
  sensitive = true
}

module "agents-dev" {
  source              = "../../modules/agents"
  tfc_agent_name      = "tfc-agent-dev"
  tfc_agent_namespace = "tfcloud"
  tfc_agent_token     = var.tfc_agent_token
  # providers configuration
  subscription_id  = "ce128ded-fc5c-4f73-b7e3-8969e546159b"
  tenant_id        = "2c03f75f-06e4-46f7-86f5-d8d70bef1cf3"
  aks_cluster_name = "weu-test-aks"
  aks_cluster_rg   = "weu-test-rg"
}
