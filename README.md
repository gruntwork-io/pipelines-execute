# Pipelines Execute

This GitHub Action automates running Terragrunt (and eventually other) commands in a secure environment.
It is designed to be run in your `<company-name>-infrastructure-pipelines` repository as part of Gruntwork Pipelines.

## Inputs

- `working_directory` (required): The folder path to run the Terragrunt command in.
- `with_ssh_enabled` (optional): Set to `true` to enable debugging via SSH using [mxschmitt/action-tmate](https://github.com/marketplace/actions/debugging-with-tmate).
- `terragrunt_command` (required): The Terragrunt command to execute. Default is `"plan"`.
- `token` (required): The GitHub token used for the Terragrunt action.
- `tg_version` (required): The Terragrunt version to install. Default is `"0.48.1"`.
- `tf_version` (required): The Terraform version to install. Default is `"1.0.11"`.
- `tg_enable_parallelism_limit` (optional): Set to `true` to enable Terragrunt parallelism. Default is `false`.

## Outputs

- `plan`: The plan output from the Terragrunt execution.

## Usage

```yaml
name: Run Terragrunt
on: [push]

jobs:
  terragrunt_job:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Run terragrunt
      id: terragrunt
      uses: gruntwork-io/pipelines-execute@v0.0.1
      with:
        token: ${{ secrets.GW_GITHUB_TOKEN }}
        tf_version: 1.0.11
        tg_version: 0.48.1
        working_directory: infrastructure-live/${{ inputs.working_directory }}
        terragrunt_command: "${{ inputs.terragrunt_command }}"
```

This example workflow defines a job that runs Terragrunt with the specified parameters.

**Note:** The provided workflow example uses the GitHub token (`${{ secrets.GITHUB_TOKEN }}`) for authentication. Ensure the token has sufficient permissions for your repository.
```

Replace `"your-username/your-repo-name@v1"` with the actual path to your action if you're publishing it as a separate action repository. Make sure to include any additional information or instructions specific to your repository or use case.