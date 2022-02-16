$PC = hostname
$OS = (Get-WmiObject win32_operatingsystem).caption
$IP = (Get-NetIPAddress -AddressFamily IPV4).IPAddress
$RAM = (Get-WmiObject Win32_PhysicalMemory | Measure-Object -property capacity -sum).sum /1gb
$GPU = (Get-WmiObject win32_videocontroller).caption
$CPU = (Get-WmiObject win32_processor).name
$USER = (Get-WmiObject win32_useraccount).caption


Write-Host
Write-Output "Arvuti informatsioon!"

Write-Host "PC" $PC
"***********************************************************************"
Write-Host "Operating System" $OS
"***********************************************************************"
Write-Host "IP" $IP
"***********************************************************************"
Write-Host "RAM $RAM GB"
"***********************************************************************"
Write-Host "GPU" $GPU
"***********************************************************************"
Write-Host "CPU" $CPU
"***********************************************************************"
Write-Host "USER" $USER
"***********************************************************************"