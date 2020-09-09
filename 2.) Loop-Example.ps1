#A do while loop while the conditions are not yet met, 
#this sounds complex but means that "Do these tasks while mom is not yet home" Example:


$Counter = 0
Do {
    if ($counter -eq "10") { $mom = "home" }
    write-host "Mom is not yet home" -ForegroundColor Green
$boom = "boom"
    $counter ++
} while ($mom -ne "home")

write-host "MOM IS HOME!" -ForegroundColor Red

