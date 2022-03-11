# Azure-cli 

- [One Cross-Platform tool for managing ALL Azure services](https://docs.microsoft.com/en-us/cli/azure/)

- [Azure-cli Extensions](https://docs.microsoft.com/en-us/cli/azure/azure-cli-extensions-overview)

- [Learning Blog about azure and azure-cli](https://learning-azure.azurewebsites.net/azure-cli/)
	- the password is password


## Azure-cli Configuration 

```
$ az configure

Welcome to the Azure CLI! This command will guide you through logging in and setting some default values.

Your settings can be found at C:\Users\jazj\.azure\config
Your current configuration is as follows:

[cloud]
name = AzureCloud

[core]
output = table
collect_telemetry = no
cache_ttl = 10

[logging]
enable_log_file = no

Environment variables:
AZURE-ENV = private
AZURE-KEYVAULT = zero-trust
AZURE-SUBSCRIPTION = CoDe-RnD-jazj
AZURE_CLI_PATH = C:\Users\jazj\scoop\apps\azure-cli\current\wbin
AZURECLIPATH = C:\Users\jazj\scoop\apps\azure-cli\current\wbin

Do you wish to change your settings? (y/N):

```



## Azure Automation with less frictions

- Do not include SubscriptionID or SubscriptionName in Script 
- Do not include Environment info like ["http", "https", "port", "domain", "userID", "Token", "Env-Prod", "Env-NonProd", "etc"]
- Do not include Security Keys in script-body or script-param
- Any data that may change move it out of script


origin repo: https://github.com/Jalalhejazi/azure-automation

```powershell
<#
    - This Coding technique is using High-Level Automation Mindset 
    - Desired State Configuration   
    - Using Documentation as comment-based. in this way we maintain the documentation in Code
    - Follow Standard PowerShell naming convention verb-noun 
    - The Naming Standard for Services can be validated using Code for One Team
    - The Naming Standard for Services can be validated using Azure Policy Cross Teams
    - Versioning and Tagging for Aligning with Releases and Tracing is possible by code
#>


function   set-azResourceGroup {
    <#
            .SYNOPSIS
            Create Azure ResourceGroup for first time or
            Update existing Azure ResourceGroup for delta changes like tagging and versioning 

            .PARAMETER resourceGroupName
            Resource groups should follow as much as possible the standard as follow:

            product_name/functionality-environment-location-rg
            environment - should be clearly stating what kind of environment it contains i.e. prod / stage / test / dev / qa
            location - should be an abbreviation of Azure Regions i.e. West Europe -> euw, North Europe -> use eun

            i.e. onecustomer-dev-euw-rg
            i.e. onecustomer-test-euw-rg
            
            i.e. onecustomer-qa-eun-rg
            i.e. onecustomer-prod-eun-rg

            .PARAMETER azureRegion
            Azure Data center close to home (Copenhagen)
            choice betweeen 
            - West Europe 
            - North Europe
            
            .PARAMETER version
            Semantic Versioning must align with git versioning for traceability 
            When Using GitOps (git act as one version of truth)
            
            .EXAMPLE
            Set-azResourceGroup -resourceGroupName "zerotrust-dev-euw-rg" -azureRegion "West Europe" -version "1.0.0" 
            .EXAMPLE
            Set-azResourceGroup -resourceGroupName "zerotrust-dev-euw-rg" -azureRegion "West Europe" -version "2.0.0" 
            .EXAMPLE
            Set-azResourceGroup -resourceGroupName "zerotrust-dev-euw-rg" -azureRegion "West Europe" -version "2.1.0" 
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'Azure ResourceGroup name')]
        [string] $resourceGroupName,
        
        [Parameter(Mandatory = $true, HelpMessage = 'Azure Region')]
        [ValidateSet("West Europe", "North Europe")]
        [string] $azureRegion,
        
        [Parameter(Mandatory = $true, HelpMessage = 'Align git version and Azure Resources for traceability and history')]
        [string] $version
    )
  
    az group create              `
        --name $resourceGroupName    `
        --location $azureRegion      `
        --tags "deployment=automation" "gitVersion=$version"    
}
  
  

function set-azStorageAccount {
    [CmdletBinding()]
    param(
        [string] $resourceGroupName,
        [string] $azureRegion,
        [string] $storageAccountName 
    )

    az storage account create               `
        --name $storageAccountName            `
        --resource-group $resourceGroupName   `
        --location $azureRegion               `
        --sku Standard_LRS                    `
        --enable-hierarchical-namespace $true

}
  
  
function get-azStorageAccountConnectionString {
    [CmdletBinding()]
    param (
        [string] $resourceGroupName,
        [string] $azureRegion,
        [string] $storageAccountName 
    )
    # Get the ConnectionString from the Storage Account and save it in memory variable as string to be returned    
    $connectionString = $(az storage account show-connection-string --name $storageAccountName --resource-group $resourceGroupName --query connectionString -o tsv)
    return $connectionString
}
  
function get-azSecret {
    [CmdletBinding()]
    param(
        [string] $secretName,
        [string] $vaultName = "zerotrust"
    )
    # Get a secret from KeyVault and return the Value 
    $secret = $(az keyvault secret show --vault-name $vaultName --name $secretName --query "value" --output tsv)
    return $secret
}
  

function set-azSecret {
    [CmdletBinding()]
    param(
        [string] $secretName,
        [string] $secretValue,
        [string] $vaultName = "zerotrust"
    )
    az keyvault secret set --vault-name $vaultName --name $secretName --value $secretValue
}


```