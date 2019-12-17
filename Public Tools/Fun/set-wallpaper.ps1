set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaper -value $desktopImage
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True