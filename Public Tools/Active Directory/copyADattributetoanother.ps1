$users = get-aduser -filter * -properties userprincipalname,emailaddress,samaccountname
foreach($user in $users){
    if($user.emailaddress -eq ""){
        #Set-ADUser -identity $user.Samaccountname -EmailAddress $($user.userprincipalname)
        
    }
}