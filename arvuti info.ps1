cls

$hostname = [system.net.dns]::GetHostName()
#
$prose = (Get-WmiObject Win32_processor).Caption | Select-Object -First 1
#
$os = (Get-WmiObject Win32_operatingsystem).Caption
#
$ip = Get-NetIPAddress -AddressFamily IPv4 | Select-Object -First 3
#
$ram = (Get-WmiObject Win32_physicalmemory | Measure-Object -Property Capacity -Sum).Sum /1gb
#
$net = (Get-NetAdapter).Name
#
$gpu = (Get-WmiObject Win32_videocontroller).Caption
#
$kasutaja = $env:USERNAME




Write-Host
Write-Host "Siin on arvuti info"
#
" "


Write-Host "Hostname: $hostname"
"----------------------------------------------------------------------------------------"
#
Write-Host "Operating System: $os"
"----------------------------------------------------------------------------------------"
#
Write-Host "CPU: $prose"
"----------------------------------------------------------------------------------------"
#
Write-Host "IP Address: $ip"
"----------------------------------------------------------------------------------------"
#
Write-Host "Mälu: $ram GB"
"----------------------------------------------------------------------------------------"
#
Write-Host "GPU: $gpu"
"----------------------------------------------------------------------------------------"
#
Write-Host "NET: $net"
"----------------------------------------------------------------------------------------"
#
Write-Host "USER: $kasutaja"
"----------------------------------------------------------------------------------------"
#