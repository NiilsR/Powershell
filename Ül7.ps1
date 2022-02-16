# Ülesanne 7 
# 24.01.2022
# Roger Niils

cls

hostname

$ADArvutid = (Get-ADComputer -filter *).name
$ADArvutid

# Leia loogilised kettad ja kirjuta massivi $ketas[C,D,N]
# Tsükli abil käime kettad läbi
# Tsükli sisse teha "IF" lause

$kettad = (Get-PSDrive -PSProvider FileSystem).name


foreach($ketas in $kettad){
    Write-Host "Ketta tähiseks on $ketas"
       # Ketta vabaruumi leidmine ja muutujasse salvestamine
      $vabaruum = [math]::Round(((Get-Volume -DriveLetter $ketas | Measure-Object -Property SizeRemaining -Sum).Sum/1gb),2)
       # Ketta koguruumi leidmine ja muutujasse salvestamine
      $kogumaht = [math]::Round(((Get-Volume -DriveLetter $ketas).Size/1gb),2)
       # Arvutamine protsentides
      $protsent = [math]::Round(($vabaruum/$kogumaht*100),2)
      $50=50
          if($protsent -lt 50){
               Write-Host "Ketas $ketas hakkab täis saama, täituvus on $protsent %"
               }
               else
               {
               Write-Host "Ketta $ketas täituvus on $protsent %"
               }

}


