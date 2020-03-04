# Introduction

Terraform template for SQL Server and Storage Account.

## How to test Terraform template locally

- Create a new folder "local" under the "environments" folder. This folder will not be committed to git.

- Create two files in "local" folder:
  - variables.tfvars
  - backend-config.tfvars

- Copy configuration from needed environment (dev, stage, prod) to `variables.tfvars`.

- Add configuration to `backend-config.tfvars`:
  
  ```terraform
  storage_account_name = "nameofyourstorageaccount"
  container_name       = "blob_container_name"
  key                  = "blob_file_name"
  access_key           = "storage_account_access_key"
  ```

- Add `azure_client_secret` variable to the `local/variables.tfvars` file to authenticate to your Azure environment.
  In order to obtain client secret, you need to [create new service principal in Azure](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html).

- Run the following commands in the root directory to initialize terraform locally and see what changes are going to be applied.

  ```terraform
  terraform init -backend-config="environments\local\backend-config.tfvars"

  terraform plan -var-file="environments\local\variables.tfvars"
  ```

## Deployment

Execute the following commands:

```terraform
terraform init -backend-config="storage_account_name=${nameofyourstorageaccount}" -backend-config="container_name=${blob_container_name}" -backend-config="key=${blob_file_name}" -backend-config="access_key=${storage_account_access_key}" -input=false

terraform validate

terraform plan -var-file="environments/${environment}/variables.tfvars" -var "azure_client_secret=${azure_client_secret}" -input=false -detailed-exitcode -out=tfplan

terraform apply -input=false -auto-approve tfplan
```
