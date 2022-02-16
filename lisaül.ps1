# Roger Niils
# 16.02.22


cls
$OU = "OU=KASUTAJAD,DC=niils,DC=Local"
Import-Module ActiveDirectory

$ADkasutajad = Get-ADUser -Filter * -Properties lastLogon | Select DistinguishedName,samaccountname, @{Name="lastLogon";Expression={[datetime]::FromFileTime($_.'lastLogon')}}

foreach($kasutaja in $ADkasutajad){
    $knimi = $kasutaja.samaccountname
    $login = $kasutaja.lastlogon
    $path = $kasutaja.distinguishedname
    $kuupäev = Get-Date
    $vahe = (New-TimeSpan -start $login -end $kuupäev).Days
    $knimi
    
    if ($vahe -gt 365){
        Write-Host "Kasutaja $ADkasutaja logis viimati süsteemi rohkem kui aasta tagasi"
        
       
        Move-ADObject -Identity $path -TargetPath "OU=EndisedTootajad,DC=niils,DC=Local"
        Disable-ADAccount -Identity $knimi
        }
        else
        {
        Write-Host "Kasutaja $knimi autentis ennast viimati $vahe päeva tagasi"
        }

}