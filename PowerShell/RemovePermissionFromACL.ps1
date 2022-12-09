# To remove NTFS permission to access a folder for a user or a group:

$path = "C:DFS\Shares\AllUsers "
$acl = Get-Acl $path
$rules = $acl.Access | where IsInherited -eq $false
$targetrule = $rules | where IdentityReference -eq "EVIL\H.Simpson"
$acl.RemoveAccessRule($targetrule)
$acl | Set-Acl -Path $path
