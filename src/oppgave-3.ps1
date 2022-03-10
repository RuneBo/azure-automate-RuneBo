
$webRequest = Invoke-WebRequest -Uri http://nav-deckofcards.herokuapp.com/shuffle

$kortstokk = $webRequest.Content | ConvertFrom-Json
#write-output $kortstokk
#foreach ( $kort in $kortstokk) {
#    write-output "$($kort.suit[0])+$($kort.value)"
#}
function kortstokkTilStreng {
    [OutputType([string])]
    param (
        [object[]]
        $kortstokk
    )
    $streng = ""
    foreach ($kort in $kortstokk) {
        $streng = $streng + "$($kort.suit[0])" + $($kort.value) + ","
    }
    return $streng = $streng.Substring(0,$streng.Length-1)
}


Write-Output "Kortstokk: $(kortStokkTilStreng -kortstokk $kortstokk)"

