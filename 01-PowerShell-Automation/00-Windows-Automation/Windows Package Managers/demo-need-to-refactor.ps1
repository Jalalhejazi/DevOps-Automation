<# 
    This PowerShell script need Refactoring and aligning with dev team

    The Dev Team need to Align what to use as one or more Package Managers or ALL
    - choco   (Windows Package Manager)
    - scoop   (PowerShell Package Manager)
    - pip     (Python)
    - npm     (Nodejs)
    - dotnet  (dotnet core)
    - code    (vscode)


    - What to install on local machine ? 
        - Some Dev use dotnet and nuget 
            - How to manage dotnet sdk ? 
            - How to manage nuget ? 

        
    - Sharing a git Repo not Yet another confluence page
    - Take a look at how I do it (https://github.com/Jalalhejazi/powershell-profile/blob/main/tools/index.ps1)
   

    - Can we use ONE git repo to align localhost + Continuous Integration Build Server ? 
#>


# Windows Package Manager (Using PowerShell)
# Install scoop (powershell package manager)
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')


# how many packages is available for git developers? ask scoop ...
scoop search git*

scoop install 7zip 
scoop install git               # Git as command line interface
scoop install gitignore         # The Dev Team Must Agree and Align on GitIgnore content 
scoop install azure-cli         # Automation Azure Services  
scoop install win32-openssh     # ssh Linux and windows (Headless Administration)    
scoop install python            # Python have a strong community for automation and AI 

# To Add GUI Tools, we need to add bucket extras first
scoop bucket add extras
scoop install googlechrome 
scoop install vscode
scoop install windows-terminal



# If you installed python, The PyPA recommended tool for installing Python packages
# https://pypi.org/search/
pip list 
pip install httpie  # install the Human Friendly REST API Tool Httpie, because curl is not for humans





# Windows Package Manager (Chocolatey)

Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install gitextensions -y
choco install dotnetcore-sdk -y
choco install dotnet-5.0-sdk -y
choco install nodejs-lts --version=12.18.4 -y
choco install azure-functions-core-tools-3 --params="'/x64:true'" -y
choco install azurestorageemulator -y
choco install microsoftazurestorageexplorer -y
choco install azure-data-studio -y
choco install postman -y
choco install ngrok -y


# choco ISSUE: choco do NOT refresh the Environment Path 
# Refresh Path Env (a hack to refresh env:path)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")




# The cross-platform DOTNET Package Management 
dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org


# HTTP as REPL

# What is REPL ? A read–eval–print loop, also termed an interactive toplevel or language shell
# Install httprepl (https://docs.microsoft.com/en-us/aspnet/core/web-api/http-repl/?view=aspnetcore-6.0&tabs=windows)
dotnet tool install -g Microsoft.dotnet-httprepl
httprepl --help







# SECRET MANAGEMENT -- Need to align 


# How to manage secrets in dotnet today? 
# https://docs.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-6.0&tabs=windows
# Safe storage of app secrets in development in ASP.NET Core


dotnet  user-secrets --help




# Intall VS Code Extensions using code as cli
# The Dev Team have to align on using the relevant extensions available

code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.azure-account
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-azuretools.vscode-cosmosdb
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension ms-azuretools.vscode-azurestaticwebapps
code --install-extension GitHub.vscode-pull-request-github
code --install-extension redhat.vscode-yaml
code --install-extension bencoleman.armview
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension mdickin.markdown-shortcuts
code --install-extension mhutchie.git-graph 
code --install-extension humao.rest-client






## Node Package Managers
# npm is a Package Manager included with Nodejs 
# You don't have to develop javaScript to use there packages

# To understand what these packages is doing follow the package repo
# npm repo <PackageName>
npm repo rimraf 


# To Install the Package 
npm install rimraf          --global 
npm install fkill-cli       --global 
npm install empty-trash-cli --global
npm install speed-test      --global
npm install is-online-cli   --global 
npm install clipboard-cli   --global
npm install is-up-cli       --global 






