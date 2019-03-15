<#
.SYNOPSIS
  Gets C: usage/disk space domainwide
.DESCRIPTION
  Based on filter, gets domain computers then gets 
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>


$computers = get-adcomputer -filter 'enabled -eq "True"'
$array = @()
foreach ($computer in $computers) {
    if(Test-Connection -computername $computer.name -count 1 -quiet){

        $disk = Get-WmiObject -computername $computer.name win32_logicaldisk -filter "DeviceID = 'C:'"

        $object = New-Object -typename psobject -property `
        @{
            Computer = $computer.name
            Used_Space = [math]::round(($disk.size - $disk.freespace)/1Gb)
            Disk_Size = [math]::round($disk.size/1gb)
        }

        $array += $object
        
    }
}

