# RUN Docker on linux Platform (WSL2)



##  (Docker & PowerShell) === Automation++ 

By running PowerShell in Docker, you have access to versions and OSes not on your host machine. 
As a result, you can test scripts in many environments without having to spin up full virtual machines.

1. Download PowerShell Latest version from mcr.microsoft.com/powershell   
2. Download Ubuntu version 18.04 
3. [Discover a list of all possible TAGS and compatible powershell versions and there supported Operating Systems](https://mcr.microsoft.com/v2/powershell/tags/list)



```powershell
docker run --platform linux --name demo -it mcr.microsoft.com/powershell:ubuntu-18.04

$PSVersionTable

<# 
Name                           Value
----                           -----
PSVersion                      7.2.1
PSEdition                      Core
GitCommitId                    7.2.1
OS                             Linux 5.10.16.3-microsoft-standard-WSL2 #1 SMP Fri Apr 2 22:2…
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
#>


# from inside the shell I can connect to the outside world using http request and response  
Invoke-RestMethod -Uri 'http://worldtimeapi.org/api/ip'

# close the container connection 
exit


# create a script to run inside the container time.ps1 

rimraf C:\dev\time.ps1
"`$PSVersionTable"  >> C:\dev\time.ps1
"Invoke-RestMethod -Uri 'http://worldtimeapi.org/api/ip'"   >>  C:\dev\time.ps1


# Copy scripts into the image (Name:demo)
docker cp C:\dev\time.ps1 demo:/root/time.ps1



# Start a Container
docker container start demo


# Execute the time.ps1 inside the running container 
docker container exec demo pwsh -command "/root/time.ps1"
```







<br>

Ref.: [Combine-PowerShell-and-Docker-to-simplify-testing-across-OSes](https://www.techtarget.com/searchitoperations/tutorial/Combine-PowerShell-and-Docker-to-simplify-testing-across-OSes)



