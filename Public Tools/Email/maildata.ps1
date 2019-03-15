
$mailreport = get-mailtrafficreport -startdate $date.AddDays(-1) -EndDate $date -eventtype goodmail,malware 
ForEach($mail in $mailreport){
    if($mail.eventtype -eq 'GoodMail'){ $good += $mail.Messagecount }
    if($mail.eventtype -eq 'Malware'){ $mal += $mail.Messagecount }
    }

$mailsummary = 
    @{
        Goodmail = $good
        Malware = $mal 
    }

$mailsummary

