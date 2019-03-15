Get-ADGroupMember "" |% {Add-ADGroupMember -identity "" -members $_.Samaccountname}
