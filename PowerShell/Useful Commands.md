Switch to PowerShell 2 engine - useful for testing if script will work on older OS (Server 2008R2).
```PowerShell
# Load PowerShell 2 engine
PowerShell.exe -Version 2

# Check PS version loaded
($PSVersionTable).PSVersion
```

Check Hash of a file (SHA265)
```PowerShell
certutil.exe -hashfile C:\file.iso SHA256
```
