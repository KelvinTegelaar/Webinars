
#Example without trycatch

get-item "C:\Temp\superFile.txt" -ErrorAction Stop

write-host "Hello, I'm down here!" -ForegroundColor Green
#Example with:

try{
    get-item "C:\Temp\superFile.txt" -ErrorAction Stop
} catch {
    write-host "The file was not found. Moving on" -ForegroundColor Green
}

write-host "Hello, I'm down here!" -ForegroundColor Green