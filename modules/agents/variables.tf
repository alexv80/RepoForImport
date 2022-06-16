variable "subscription_id" {
  type        = string
  description = "Azure subscription id where the aks cluster is."
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant id where the aks cluster is."
}

variable "aks_cluster_name" {
  type        = string
  description = "Aks cluster where the agents will be deployed."
}

variable "aks_cluster_rg" {
  type        = string
  description = "Resource group of aks cluster where the agents will be deployed."
}

variable "tfc_agent_token" {
  type        = string
  description = "TFC agent token (it is retreived from TF Cloud when creating an agent pool)."
}

variable "tfc_agent_name" {
  type        = string
  description = "The name of the TFC agents create in TF Cloud."
}

variable "tfc_agent_namespace" {
  type        = string
  description = "Kubernetes namespace in which the TF Cloud agents will be deployed."
}

variable "labels" {
  description = "A map of labes to add to the deployment"
  type        = map(string)
  default     = {}
}
