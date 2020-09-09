$ExpectedIndex = "6.0"
$ExpectedTimetoRun = (get-date).AddDays(-1)

$Metrics = Get-CimInstance -ClassName win32_reliabilitystabilitymetrics | Select-Object -First 1
$Records = Get-CimInstance -ClassName win32_reliabilityRecords | Where-Object { $_.TimeGenerated -gt $Metrics.StartMeasurementDate }
 
$CombinedMetrics = [PSCustomObject]@{
    SystemStabilityIndex = $Metrics.SystemStabilityIndex
    'Start Date'         = $Metrics.StartMeasurementDate
    'End Date'           = $Metrics.EndMeasurementDate
    'Stability Records'  = $Records
}
 
if ($CombinedMetrics.SystemStabilityIndex -lt $ExpectedIndex) { 
    write-host "The system stability index is lower than expected. This computer might not be performing in an optimal state. The following records have been found:"
}
 
if ($CombinedMetrics.'Start Date' -lt $ExpectedTimetoRun) {
    write-host "The system stability index has not been updated since $($CombinedMetrics.'Start Date'). This could indicate an issue with event logging or WMI."
}