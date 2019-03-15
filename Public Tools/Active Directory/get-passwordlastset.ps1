#Find out when passwords were last set. Used for environment where password age was not set on default domain policy.

get-aduser -filter 'enabled -eq "true"' -properties * | sort-object | ft name,passwordlastset