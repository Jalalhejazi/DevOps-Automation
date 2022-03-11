

git clone "https://dgsit@dev.azure.com/dgsit/Infrastructure/_git/POC_Zero_Trust"

cd POC_Zero_Trust


## What can we do with Azure Pipelines ? 
az pipelines --help

## What can we do with Azure Pipelines build ? 
az pipelines build --help

# list top 10 builds and output as default configuration
az pipelines build list --top 10 

# list top 10 builds and output as json
az pipelines build list --top 10 --output json



# devops invoke
az devops invoke --area wiki --resource wikis --route-parameters project=Infrastructure --output jsonc