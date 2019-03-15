#Takes all machines W7NO*, finds the app's age and compares to distribute's version.
#modify $app to change. Some distribute paths are not consistent.

$computers = get-adcomputer -filter 'name -like "W7NO*"'
$app = "leadread"               #beware inconsistant pathing breaks script (leadread vs leadreadUSB)
$path = "c$\program files\$app\$app.exe"
$target = "\\allulu\distribute\$app\support\$app.exe"
$update = (get-childitem $target).LastwriteTime


# find, kill, copy
foreach($computer in $computers)
    {
        $cname = $computer.name
        $pcdate = (get-childitem "\\$cname\$path").LastWriteTime
        if($pcdate -lt $update)
        {
            (Get-WmiObject Win32_Process -ComputerName $cname | where-object{ $_.ProcessName -match $app }).Terminate()
            copy-item -path $target -Destination "\\$cname\$path"   
        }
        write-host $cname "has/had timestamp of"$pcdate
    }