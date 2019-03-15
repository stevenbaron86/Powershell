Get-WmiObject -Class Win32_Product | Out-GridView

$apps = Get-WmiObject -Class Win32_Product -Filter "Vendor like '######'" 

foreach($app in $apps){$app.uninstall()}
