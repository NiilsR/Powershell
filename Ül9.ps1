#Harjutus09
#02.02.22
#Roger Niils

# Tühjendame käsurea
cls

# Tekitame massiivi
$csv_header=@("name;username;email;password")

# Lisame päise
$csv_header | Set-Content $dir\emails.csv

# Loeme sisse kasutajad
$users = Import-Csv $dir\users.csv

# Kasutame tsüklit
$kasutajad = Import-Csv $dir\users.csv


foreach($kasutaja in $kasutajad){

        # Leiame nimed ja kasutajanimed
        $eesnimi = $kasutaja.first_name
        $perenimi = $kasutaja.last_name
        $kasutajanimi = $eesnimi[0]+$perenimi
        $lower = $kasutajanimi.tolower()
        $email = ($eesnimi+"."+$perenimi).ToLower() + "@hkhk.edu.ee"
    
        # Loome paroolid
        $pass = 1..3 | ForEach-Object { Get-Random -Maximum $perenimi.Lenght}
        $pass = -join $perenimi[$pass]
        $pass += Get-Random -Maximum 10
        $pass += Get-Random -Maximum 10
    
        # Lisame nimed, kasutajanimed, emailid ja paroolid ühte veergu
        $row = $eesnimi + " " + $perenimi + ":" + $lower + ":" + $email + ":" + $pass
        Add-Content $dir\emails.csv $row

    }