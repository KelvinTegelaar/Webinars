$Procs = get-process | Sort-Object -Unique -Property Name

foreach ($Item in $Procs) {
    [PSCustomObject]@{
        Name              = $item.Name
        'Product Version' = $item.ProductVersion  
        'File Version'    = $item.FileVersion
    }
}



$OurOwnObject = foreach ($Item in $Procs) {
    [PSCustomObject]@{
        Name              = $item.Name
        'Product Version' = $item.ProductVersion  
        'File Version'    = $item.FileVersion
    }
}