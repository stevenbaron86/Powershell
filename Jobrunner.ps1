<#
.SYNOPSIS
Jobrunner allows many tasks to be ran in parallel and email results
from a single task scheduled on $server

.DESCRIPTION
Jobrunner uses the name of each subdirectory to create jobs, start 
the script in the subdirectory, and record the logfile location. 
Because of this, there is a required structure to add jobs to the 
nightly task as follows:

.\$jobname\$jobname.ps1
.\$jobname\temp\log.txt

#>




set-location -path 

#create jobs below based on directory name. 

$logfile = @()
$jobdirectory = Get-ChildItem | Where-Object {$_.psiscontainer -eq "true"}
foreach($jobdir in $jobdirectory){
    $jobname = $jobdir.Name
    start-job -name $jobname -FilePath .\$jobname\$jobname.ps1
    $logfile += ".\$jobname\temp\log.txt"
}


#Now wait til all the jobs complete

while(get-job -state "Running"){
    start-sleep 30
    get-job | Out-File .\temp\log.txt
}
get-job | receive-job | Out-File .\temp\log.txt

#email credentials 
$date = get-date -format g
$User =  #user to send as
$to =  #user to receive 
$Pass = Get-Content ".\data\pass.txt" | ConvertTo-SecureString
$UserCredential = New-Object -typename System.Management.Automation.PSCredential -argumentlist $User, $Pass




$body = (Get-Content $logfile) -Join "<br>"
$body = "<font face='Courier New' font size='1'><pre>$body</pre></font>"
Send-MailMessage -To $To -From $user -Subject "$date Daily Task Results" -Body $body -BodyAsHtml -Credential $UserCredential -SmtpServer smtp.office365.com -Port 587 -UseSsl 