## Azure DevOps CLI 

- https://docs.microsoft.com/en-us/azure/devops/cli/?view=azure-devops

CLI commands enable you to streamline your tasks with faster and flexible interactive canvas, bypassing user interface workflows.

## DevOps Configure on Cloud

```powershell
az devops configure --defaults organization=https://dev.azure.com/dgsit project=Infrastructure
```



```powershell
az extension add --name azure-devops


$Organization="https://dev.azure.com/dgsit"
$Project="Infrastructure"

az devops configure --defaults organization=$Organization project=$Project

az devops configure --list


# What can I do with Azure DevOps
az devops --help 

# list all available repos from default project 
az repos list

# To see HTTP API Request and Response trace use --debug
az repos list --debug


# list pipelines build 
az pipelines build list --top 10 




# How to Query the JSON response using JMESPath 
## JMESPath (https://jmespath.org) is a query language for JSON
## like Xpath for XML 
## like LinQ for C# 


$data = $(az pipelines build list --top 10 --output json --query "[].buildNumber")

echo $data

```




## az devops invoke

- https://docs.microsoft.com/en-us/rest/api/azure/devops/

```
$ az devops invoke --help
This command is from the following extension: azure-devops

Command
    az devops invoke : This command will invoke request for any DevOps area and resource. Please use
    only json output as the response of this command is not fixed. Helpful docs -
    https://docs.microsoft.com/en-us/rest/api/azure/devops/.

Arguments
    --accept-media-type  : Specifies the content type of the response.  Default: application/json.
    --api-version        : The version of the API to target.  Default: 5.0.
    --area               : The area to find the resource.
    --detect             : Automatically detect organization.  Allowed values: false, true.
    --encoding           : Encoding of the input file. Used in conjunction with --in-file.  Allowed
                           values: ascii, utf-16be, utf-16le, utf-8.  Default: utf-8.
    --http-method        : Specifies the method used for the request.  Allowed values: DELETE, GET,
                           HEAD, OPTIONS, PATCH, POST, PUT.  Default: GET.
    --in-file            : Path and file name to the file that contains the contents of the request.
    --media-type         : Specifies the content type of the request.  Default: application/json.
    --org --organization : Azure DevOps organization URL. You can configure the default organization
                           using az devops configure -d organization=ORG_URL. Required if not
                           configured as default or picked up via git config. Example:
                           https://dev.azure.com/MyOrganizationName/.
    --out-file           : Path and file name to the file  for which this function saves the
                           response body.
    --query-parameters   : Specifies the list of query parameters.
    --resource           : The name of the resource to operate on.
    --route-parameters   : Specifies the list of route parameters.

Global Arguments
    --debug              : Increase logging verbosity to show all debug logs.
    --help -h            : Show this help message and exit.
    --only-show-errors   : Only show errors, suppressing warnings.
    --output -o          : Output format.  Allowed values: json, jsonc, none, table, tsv, yaml,
                           yamlc.  Default: table.
    --query              : JMESPath query string. See http://jmespath.org/ for more information and
                           examples.
    --subscription       : Name or ID of subscription. You can configure the default subscription
                           using `az account set -s NAME_OR_ID`.
    --verbose            : Increase logging verbosity. Use --debug for full debug logs.

Examples
    Discover areas related to 'Wiki'
        az devops invoke --query "[?contains(area,'wiki')]"


    Get all wikis in a project
        az devops invoke --area wiki --resource wikis --route-parameters project={Project Name} -o json
        az devops invoke --area wiki --resource wikis --route-parameters project=WikiIssue -o json


    Add page to a wiki
        az devops invoke --area wiki --resource pages --route-parameters project={Project Name}
        wikiIdentifier={Wiki Id} --in-file {Full File Path containing text to add to wiki}
        --query-parameters path={Page Path In Wiki} --http-method PUT --api-version 5.1-preview -o
        json
        az devops invoke --area wiki --resource pages --route-parameters project=WikiIssue
        wikiIdentifier=e479f402-2be8-4953-bb0b-3a0209cbc2d2 --in-file
        D:/temp/createWikiRequestBody.txt
        --encoding 'utf-8' --query-parameters path=sample738 --http-method PUT --api-version
        5.1-preview -o json


To search AI knowledge base for examples, use: az find "az devops invoke"

Please let us know how we are doing: https://aka.ms/azureclihats

```