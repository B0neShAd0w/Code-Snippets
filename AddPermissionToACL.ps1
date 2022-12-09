# To add the permissions on an object:

$path = "C:DFS\Shares\AllUsers "
$user = "EVIL\H.Simpson"
$Permiss = "Read, ReadAndExecute, ListDirectory"
$InheritSettings = "Containerinherit, ObjectInherit"
$PropogationSettings = "None"
$RuleType = "Allow"
$acl = Get-Acl $path
$perm = $user, $Permiss, $InheritSettings, $PropogationSettings, $RuleType
$rule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $perm
$acl.SetAccessRule($rule)
$acl | Set-Acl -Path $path
