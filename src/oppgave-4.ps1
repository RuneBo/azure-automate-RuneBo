param ($url_input)
$ErrorActionPreference = 'stop'
#$webRequest = Invoke-WebRequest -Uri http://nav-deckofcards.herokuapp.com/shuffle


$webRequest = Invoke-WebRequest -Uri $url_input
$kortstokk = $webRequest.Content | ConvertFrom-Json

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

