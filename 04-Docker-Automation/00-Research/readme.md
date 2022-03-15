
# [Researching: First step need to decide between Windows or Linux](https://javier-ramos.medium.com/docker-windows-vs-linux-1bb26d8090b3)




## Hello World "The must have Demo"


```powershell 

$step1 = $(docker run --rm --platform linux busybox echo Output Data 01 )
$step2 = $(docker run --rm --platform linux busybox echo Output Data 02 )

echo "Hello Automation $step1 -- $step2"

# Hello Automation Output Data 01 -- Output Data 02
```





# Discover Microsoft Container Registry (MCR)? 

- Browsing MCR Content (https://github.com/microsoft/containerregistry)
- For Discovery (https://mcr.microsoft.com/v2/_catalog)


