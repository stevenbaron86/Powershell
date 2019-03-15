
$param = @{
    To = 
    From = 
    Subject = 
    Body =
    SmtpServer = 
    Port = 
    Credential = Get-Credential
    Attachments = 
}

Send-MailMessage @param -UseSsl -BodyAsHtml