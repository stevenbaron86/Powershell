#credentials
$User = 
$Pass = Get-Content "string.txt" | ConvertTo-SecureString
$UserCredential = New-Object -typename System.Management.Automation.PSCredential -argumentlist $User, $Pass

$test = Get-Content -Raw 

#mail
Send-MailMessage -To "" -From "" -Subject "test" -Body "$test" -Credential $UserCredential -SmtpServer smtp.office365.com -Port 587 -UseSsl



