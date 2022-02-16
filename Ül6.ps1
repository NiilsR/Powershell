cls

$nimi = "Roger Niils"
$email = "niilsroger@gmail.com"
Set-Variable =readonly
${kuu päev} = Get-Date -Format dd.MM.yyyy

Write-Host "Nimi" $nimi
"--------------------------"
Write-Host "Email" $email
"--------------------------"
Write-Host "Kuupäev" ${kuu päev}
"--------------------------"



$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht

$emailid = Get-content -path C:\POWERSHELL\emailid.txt
$emailid.split(",")
$emailid.contains("@")
$emailid += ",$email"
$emailid[0.-1]

$kogus = ($emailid.split(",") | Measure-Object).Count

Write-Output $kogus

