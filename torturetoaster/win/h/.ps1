# Function to get available memory in MB
function Get-AvailableMemoryMB {
    $os = Get-WmiObject -Class Win32_OperatingSystem
    return [math]::Round($os.FreePhysicalMemory / 1024)
}

# Loop to open Calculator until available memory is less than 500 MB
while ((Get-AvailableMemoryMB) -gt 500) {
    Start-Process "calc.exe"
    Start-Sleep -Milliseconds 100
}

Write-Output "done. 1"