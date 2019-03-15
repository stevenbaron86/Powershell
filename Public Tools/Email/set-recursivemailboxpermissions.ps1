#set ownership recursively on entire shared mailbox

$mailbox = 
$user = 


ForEach($f in (Get-MailboxFolderStatistics $mailbox | Where { $_.FolderPath.Contains("/") -eq $True } ) )
{
$fname = "$mailbox" + ":" + $f.FolderPath.Replace("/","\"); Add-MailboxFolderPermission $fname -User $user -AccessRights Owner
Write-Host $fname
Start-Sleep -Milliseconds 1000
}