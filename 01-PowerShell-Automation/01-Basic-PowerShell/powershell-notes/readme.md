
# Windows PowerShell vs. PowerShell 

- PowerShell 5.1 (called "Windows PowerShell") 
- PowerShell 6.x (called "PowerShell Core")
- PowerShell 7.x (called simply "PowerShell")

- https://4sysops.com/archives/powershell-v5-and-v7which-to-use-and-when/


## Discover $Profile (your Powershell configuration) 

- You can save your configs ["Azure Subscription", "Secret Store", "StorageAccount", "CI config", "git configs", "Alias", "Custom Functions"]
- [My Profile configuration](https://github.com/Jalalhejazi/powershell-profile) is aligned to work on Linux, Mac, Windows, CloudShell


## Create $profile for first time

```powershell
New-Item -Path $PROFILE -ItemType File -Force
notepad $profile
```

## PowerShell Editor with VSCODE

- https://code.visualstudio.com/download

```powershell
code $profile
```


## Download Help files

Download and installs the newest help files on your computer.
start powershell as admin user:
- Update-Help -ErrorAction Ignore 
- Update-Help -ErrorAction Ignore -UICulture en-US



## Get Help 
- Get-Help about_* 

```powershell

Get-Help about_* | out-file c:\dev\powershell_help.txt

```


- Get-Help about_*  > ./powershell_help.txt
- Get-Help about_Profiles
- Get-Help about_Aliases


## Contents
- [Overview](overview.md)
- [Variables, Operators, TypeCasting](building_blocks.md)
- [Read Validate and Write](read_validate.md)
- [Comparison Operators](comparison.md)
- [If else and Switch](conditional.md)
- [Collections](collections.md)
- [Loops](loops.md)
- [Functions](functions.md)
- [Processes and Services](process_and_service.md)
- [Working Data](data.ps1)
- [Debugging](debug/demo01.ps1)


## References
- [Microsoft PowerShell Resource](https://docs.microsoft.com/en-us/powershell)
- [CheatSheet](https://ss64.com/ps/)


