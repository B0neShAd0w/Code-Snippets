Switch to PowerShell 2 engine - useful for testing if script will work on older OS.
```
# Load PowerShell 2 engine
PowerShell.exe -Version 2

# Check PS version loaded
($PSVersionTable).PSVersion
```

# Check Hash of a file (SHA265)
certUtil -hashfile C:\file.img SHA256
