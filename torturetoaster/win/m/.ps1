# Function to estimate crash risk
function Estimate-CrashRisk {
    param (
        [int]$cpuUsage,
        [int]$freeMem
    )

    if ($cpuUsage -gt 90 -and $freeMem -lt 100000) {
        return "High"
    } elseif ($cpuUsage -gt 75 -and $freeMem -lt 200000) {
        return "Medium"
    } else {
        return "Low"
    }
}

# Monitor system resources and display in a neat ASCII table
while ($true) {
    Clear-Host
    Write-Host "------------------------"
    Write-Host "Torture toaster V0.1.0"
    Write-Host "------------------------"
    Write-Host
    Write-Host
    Write-Host
    Write-Host "System Resource Usage"
    Write-Host "---------------------"
    Write-Host "Time       CPU (%)   Memory (kB)  Crash Risk"
    Write-Host "---------------------------------------------"

    $vmstat = & vmstat 1 2 | Select-Object -Last 1
    $date = Get-Date -Format "HH:mm:ss"
    $cpuUsage = 100 - ($vmstat -split "\s+")[14]
    $freeMem = ($vmstat -split "\s+")[3]

    $line = "{0,-10} {1,-8} {2,-10}" -f $date, $cpuUsage, $freeMem
    $crashRisk = Estimate-CrashRisk -cpuUsage $cpuUsage -freeMem $freeMem
    Write-Host "$line $crashRisk"

    Start-Sleep -Seconds 1
}