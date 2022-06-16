workspace_settings = [
    {
        workspace_name      = "${{ values.workspace_name }}"
        organization_name   = "${{ values.organization_name }}"
        execution_mode      = "${{ values.execution_mode }}"
        auto_apply          = ${{ values.auto_apply }}
        speculative_enabled = ${{ values.speculative_enabled }}
        working_directory   = "${{ values.working_directory }}"
        identifier          = "${{ values.identifier }}"
        ingress_submodules  = ${{ values.ingress_submodules }}
        component           = "${{ values.component }}"
        environment         = "${{ values.environment }}"
        oauth_token_id      = "${{ values.oauth_token_id }}"
    }
]
