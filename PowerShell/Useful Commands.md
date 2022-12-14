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

---

## Hyper-V
```PowerShell
# Create a new "Internal" vSwitch

New-VMSwitch -SwitchName "NAT vSwitch" -SwitchType Internal

# Assign IP address to the new "Internal NAT vSwitch"

New-NetIPAddress -IPAddress 10.10.10.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NAT vSwitch)"

# Configure the network address of the NAT network

New-NetNAT -Name NATNetwork -InternalIPInterfaceAddressPrefix 10.10.10.0/24

# Allow 'RDP' to all IP's on Host to all IP's on the NAT Network
Add-NetNatStaticMapping `
  -ExternalIPAddress "0.0.0.0/0" `
  -ExternalPort 3389 `
  -Protocol TCP `
  -InternalIPAddress "10.10.10.0/24" `
  -InternalPort 3389 `
  -NatName NatNetwork
```

View Nat rules
```bash
Get-NetNat
```

---

## Send Mail
Send email from within script (Using Office 365 SMTP)
```PowerShell
$expirydate = Get-date

$smtpServer = "smtp.office365.com"
$smtpPort = '587'
$smtpSender = "sender@SomeEmail.com"


$To = "me@SomeEmail.com"
$Subject = "Some Subject"
$Body = "<h1>Body Heading</h1><br><br>"
$Body += "<h3>Main Body - First Line</h3><br><br>"
$Body += “Main Body - more lines<br><br>”
$Body += “Main Body - more lines<br>”
$Body += “Main Body - more lines”

Send-MailMessage `
  -From $smtpSender `
  -To $To `
  -Subject $Subject `
  -Body $Body -BodyAsHtml `
  -SmtpServer $smtpServer `
  -Port $smtpPort `
  -UseSsl `
  -Credential (Get-Credential)
```

---

## General

Windows 11 Clean Install - Add Local User (Bypass the stupid Microsoft Account garbage)
```PowerShell
# At the "Lets get connected" page press SHIFT+F10 to open a command prompt and run the command below:

oobe\bypassnro

# After the computer restarts a 'local account' can be used
```

Windows 11 - Unsupported hardware (VM etc.)
```PowerShell
# Press Shift + F10 at the start of the setup process, enter the following commands:

reg add HKLM\System\Setup\LabConfig /v BypassTPMCheck /t reg_dword /d 1
reg add HKLM\System\Setup\LabConfig /v BypassSecureBootCheck /t reg_dword /d 1
reg add HKLM\System\Setup\LabConfig /v BypassRAMCheck /t reg_dword /d 1
```


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
Extract all Installed Drivers
```powershell
dism /online /export-driver /destination:"[DESTINATION]"
```
