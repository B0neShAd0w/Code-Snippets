# To disable folder inheritance:

$path = "C:DFS\Shares\AllUsers "
$acl = Get-ACL -Path $path
# First $True shows if the folder is protected
# Second $True specifies if the current NTFS permissions have to be copied
$acl.SetAccessRuleProtection($True, $True) 
Set-Acl -Path $path -AclObject $acl
