$date = (get-date) - (new-timespan -days 60)

get-adcomputer -filter 'enabled -eq "true" -and lastlogondate -le $date' -Properties lastlogondate | sort name|  ft name,lastlogondate 
