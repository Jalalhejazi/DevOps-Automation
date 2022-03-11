
# Inspect PSDevOps Module


## Install

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-Module -Name PSDevOps -Repository PSGallery -Force -Scope CurrentUser

Import-Module PSDevOps -Force -PassThru



## Discover 

Get-Command -Module PSDevOps

<#
    $ Get-Module PSDevops | Get-PSDevOps # Gets related commands

    Name                                 ScriptType Synopsis Parameters
    ----                                 ---------- -------- ----------
    PSDevOps.ezformat.ps1                ezformat
    PSDevOps.GitHubWorkflow.psdevops.ps1 psdevops
    PSDevOps.Pipeline.PSDevOps.ps1       PSDevOps
    PSDevOps.tests.ps1                   tests               [string]$TestOrg
                                                             [string]$TestProject
#>



## Connect on cloud
Get-help    Connect-ADO -Example

$Organization   = "https://dev.azure.com/OrganizationName"
$Project        = "DemoProject"

# Connect with UseDefaultCredentials or PersonalAccessToken
Connect-ADO -Organization $Organization -UseDefaultCredentials

# Using Pipeline mindset (Cascading Query)
Get-ADOProject | Get-ADOTeam | Get-ADODashboard
