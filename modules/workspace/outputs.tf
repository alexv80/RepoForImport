output "workspace_id" {
  description = "The id of the Terraform Cloud Workspace that is created."
  value       = values(tfe_workspace.terraform_cloud_workspace)[*].id
}
