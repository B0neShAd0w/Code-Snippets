## Active Directory
Clear User attribute(s)
```PowerShell
# Clear the 'Info' attribute
Set-ADUser -Identity $user -Clear Info

# Clear the 'EmailAddress' attribute
Set-ADUser -Identity $user -EmailAddress $null
```

Set the ms-DS-Logon-Time-Sync-Interval (Default is not set - which is 9-14 days)
```PowerShell
Get-ADDomain | Set-ADDomain -LastLogonReplicationInterval "1"
```

## General

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
