# PowerShell script to download and configure Sysmon

# Sysmon configuration file URL
$sysmonUrl = "https://github.com/ion-storm/sysmon-config/raw/master/sysmonconfig-export.xml"

# Paths for downloaded files
$downloadPath = "$env:TEMP\sysmon.zip"
$extractPath = "$env:TEMP\sysmon"

# Download Sysmon configuration file
Invoke-WebRequest -Uri $sysmonUrl -OutFile $downloadPath

# Extract the downloaded zip file
Expand-Archive -Path $downloadPath -DestinationPath $extractPath

# Copy Sysmon executable
Copy-Item -Path "$extractPath\sysmon.exe" -Destination "C:\Windows\System32\sysmon.exe" -Force

# Copy configuration file
Copy-Item -Path "$extractPath\sysmonconfig-export.xml" -Destination "C:\Windows\System32\sysmonconfig.xml" -Force

# Install Sysmon with the configuration file
Start-Process -FilePath "C:\Windows\System32\sysmon.exe" -ArgumentList "/accepteula -i C:\Windows\System32\sysmonconfig.xml"

# Clean up
Remove-Item -Path $downloadPath -Force
Remove-Item -Path $extractPath -Recurse -Force
