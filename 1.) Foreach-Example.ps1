#foreach loops through an array(a list of items) and can perform actions on each item.

$ListOfItems = "C:\Temp\New Text Document.txt", 
"Two items", 
"Three items", 
"Four Items"

foreach ($item in $ListOfItems ) {
    
   remove-item -Path $item

}

#But what if we do the same with a more complex list? Lets grab our current processes


$ListOfobjects = Get-Process

foreach ($Item in $ListOfobjects ) {
    
    write-host "I am current at $Item" -ForegroundColor Green

}

#does not show what we want:
foreach ($Item in $ListOfobjects ) {
    
    write-host "I am current at $Item.processname" -ForegroundColor Green

}

#shows what we want. This is called an "Expression" $()
foreach ($Item in $ListOfobjects ) {
    
    write-host "I am current at $($Item.processname) - $($item.Handle)" -ForegroundColor Green

}
 
$ListOfobjects = Get-ChildItem -Path "C:\Temp"
foreach ($Item in $ListOfobjects ) {
    if($item.name -like "*Excel*"){ $item }
}
 