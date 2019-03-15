$computer = ""
$drive_letter = ""
$drive_path = ""


Invoke-Command -ComputerName $computer -ScriptBlock {$netobj = New-Object -ComObject "Wscript.Network";$network.MapNetworkDrive($drive_letter,$drive_path)}

invoke-command -computername "" -ScriptBlock {New-PSDrive -Name "" -PSProvider FileSystem -root "" -persist}