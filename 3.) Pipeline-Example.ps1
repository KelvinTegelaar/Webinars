#the pipeline in PowerShell is a powerfull to to execute code on a single line. some examples:

get-process "outlook" | Stop-Process

#does not work:
Get-ChildItem "C:\Temp" | Rename-Item "*_Archive"

#does work:
Get-ChildItem "C:\Temp" | ForEach-Object { Rename-Item -Path $_.FullName -NewName "Archive $($_.Name)" }

Get-ChildItem "C:\Temp" | Where-Object { $_.Extension -eq ".txt" }

get-aduser -filter * | Where-Object {$_.homepath -like "\\OLDSERVER\*"}