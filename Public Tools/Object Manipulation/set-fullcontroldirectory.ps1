$user = Read-Host
$path = Read-Host


$acl = get-acl $path
$Ar = New-Object  System.Security.AccessControl.FileSystemAccessRule($user,"FullControl","ContainerInherit,ObjectInherit","None","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $path $Acl