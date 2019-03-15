<#
.SYNOPSIS
  Gets name of user currently logged in
.DESCRIPTION
  Gets name of user by querying WMIObject win32_computersystem. Exports simple result or can be output as
  ADUser Object with all properties
.PARAMETER <$computername>
  Mandatory parameter of computer name to query as string
.PARAMETER <$AsADObject>
  Optional switch to output as an AD Object. Returns all properties.
.NOTES
  Version:        1.0
  Author:         Steven Baron
  Email:          stevenbaron86@gmail.com
  Creation Date:  3/15/2019
  
.EXAMPLE
  Get-LoggedOnUser -ComputerName $computername -AsADObject
  Get-LoggedOnUser $computername
#>

Function Get-LoggedOnUser {

    Param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$computerName,
        [Parameter(Mandatory=$false, Position=1)]
        [switch]$AsADObject
    )

    $LoggedOnUser = Get-WmiObject win32_computersystem -comp $ComputerName

    if($AsADObject){
        $UserName = $loggedonuser.username.tostring().replace("CCREEKDOM\","")
        Get-ADUser -Filter {samaccountname -eq $UserName} -Properties *
    }
    else{
        $loggedOnUser | Select-Object USername,Caption,Manufacturer
    }
    
}