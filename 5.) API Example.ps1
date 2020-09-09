#We set the ports we want excluded
$PortExclusions = '80', '443', "8082",'8081',"32400"
#We grab the current IP via an API
$CurrentIP = (Invoke-RestMethod -uri "http://ifconfig.me/ip" -UseBasicParsing)
#We create a list of IPs we want to test, the current IP and an external IP
$ListIPs = @($CurrentIP, "1.1.1.1")
#For each IP in the list we're going to perform a task. We want the results of the task stored in the variable $Shodan
$Shodan = foreach ($ip in $ListIPs) {
    try {
        $ReqFull = Invoke-RestMethod -uri "https://api.shodan.io/shodan/host/$($ip)?key=$APIKEY"
    }
    catch {
        write-host "Could not get information for host $IP. Error was:  $($_.Exception.Message)"
        continue
    }
    foreach ($req in $ReqFull.data | Where-Object { $_.port -notin $PortExclusions }) {
        [PSCustomObject]@{
            'IP'                    = $req.ip_str
            'Detected OS'           = $Req.data.OS
            'Detected Port'         = $req.port
            'Detected ISP'          = $req.isp
            'Detected Data'         = $req.data
            'Found vulnerabilities' = $req.opts.vulns
        }
    }
}
 

if (!$Shodan) {
    write-host "Healthy - Hosts are not found in Shodan." 
} 
else {
    write-host "Hosts are found in Shodan. Information:" -ForegroundColor Red
    $Shodan | Format-Table
} 