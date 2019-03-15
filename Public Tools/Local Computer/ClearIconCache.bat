ie4uinit.exe -ClearIconCache
taskkill /IM explorer.exe /F
DEL "%localappdata%\IconCache.db" /A
DEL "%localappdata%\Microsoft\Windows\Explorer\iconcache*" /A
shutdown /r /f /t 00