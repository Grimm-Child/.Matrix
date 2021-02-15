# How To:
## Restart WSL
*Source:* [Grimm-Child](https://github.com/Grimm-Child/.Matrix)

### Shutdown everything: `Build 18917`+
```cmd
wsl.exe --shutdown
```

### Terminate specific distro: Windows `1903`+
```cmd
wsl.exe -t <DistroName>
```

##### Older versions

## PowerShell (admin)
```
Restart-Service LxssManager

# or
net stop LxssManager
net start LxssManager
```

## or CMD (admin)
```cmd
net stop LxssManager
net start LxssManager
```
