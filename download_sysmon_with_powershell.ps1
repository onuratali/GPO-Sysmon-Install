# PowerShell script to download and configure Sysmon

# Sysmon executable URL (from Sysinternals)
$sysmonExeUrl = "https://download.sysinternals.com/files/Sysmon.zip"

# Sysmon configuration file URL
$sysmonConfigUrl = "https://github.com/ion-storm/sysmon-config/raw/master/sysmonconfig-export.xml"

# Paths for downloaded files
$downloadPath = "$env:TEMP\sysmon.zip"
$extractPath = "$env:TEMP\sysmon"

try {
    # Download Sysmon executable
    Invoke-WebRequest -Uri $sysmonExeUrl -OutFile $downloadPath -ErrorAction Stop

    # Extract Sysmon executable from zip
    Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

    # Copy Sysmon executable
    Copy-Item -Path "$extractPath\sysmon.exe" -Destination "C:\Windows\System32\sysmon.exe" -Force

    # Download Sysmon configuration file
    Invoke-WebRequest -Uri $sysmonConfigUrl -OutFile "C:\Windows\System32\sysmonconfig.xml" -ErrorAction Stop

    # Install Sysmon with the configuration file
    Start-Process -FilePath "C:\Windows\System32\sysmon.exe" -ArgumentList "/accepteula -i C:\Windows\System32\sysmonconfig.xml" -Wait

    Write-Output "Sysmon installation and configuration completed successfully."

} catch {
    Write-Error "Error occurred while downloading or configuring Sysmon: $_"
    exit 1
} finally {
    # Clean up downloaded files
    if (Test-Path $downloadPath) { Remove-Item -Path $downloadPath -Force }
    if (Test-Path $extractPath) { Remove-Item -Path $extractPath -Recurse -Force }
}
