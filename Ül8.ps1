#Roger Niils
#Ül 8
#27.01.2022

cls

function raadius{
     <#
    .SYNOPSIS
        Kirjuta siia raadius.
    .DESCRIPTION
        Kirjuta siia raadiuse cm ja see muudetakse pindalaks.
    .EXAMPLE
    Kui paned raadiusesse nr 2 siis saad vastuseks 12.57.    
    #>
          param
          (
          [Parameter(Mandatory=$true, HelpMessage='Lisa siia ringi raadius')]
          $raadius
          )
          [Math]::Round([Math]::PI*[Math]::Pow($raadius,2),2)

        "Pindala on $raadius"
}
raadius


function täisnimi{
            <#
    .SYNOPSIS
        Kirjuta siia enda täisnimi.
    .DESCRIPTION
        Kirjuat nimi täpi tähtedega ja see muudab need tavalisteks.
    .EXAMPLE
        öö=oo

    #>

        param
            (
            [Parameter(Mandatory=$true, HelpMessage='Lisa siia enda täisnimi')]
            $nimi2
            )
            $nimi=$nimi2 -replace "\s+"," "
                $asenda = $nimi.Replace("ü","u").Replace("õ","o").Replace("ö","o").Replace("ä","a")
                (Get-Culture).TextInfo.ToTitleCase($asenda.tolower())
}
täisnimi