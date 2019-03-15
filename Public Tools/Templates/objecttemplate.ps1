$object = New-Object -typename psobject -property `
        @{
            
            MailboxType =  get-mailbox $user | select -ExpandProperty recipienttypedetails 
            License = get-msoluser -UserPrincipalName $user | select -ExpandProperty islicensed 
            Userprincipalname = $user
            ForwardingAddress = get-mailbox $user | Select -expandproperty forwardingaddress
            ADEnabled = (Get-ADUser -filter "UserPrincipalName -eq '$($user)'").Enabled
        }