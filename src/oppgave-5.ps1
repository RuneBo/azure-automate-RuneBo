param ($url_input)
$ErrorActionPreference = 'stop'
$webRequest = Invoke-WebRequest -Uri $url_input


#$webRequest = Invoke-WebRequest -Uri $url_input
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
$poengKortstokk = 0

foreach ($kort in $kortstokk) {
    if ($kort.value -ceq 'J' -or $kort.value -ceq 'Q' -or $kort.value -ceq 'K') {
        $poengKortstokk = $poengKortstokk + 10
    }
    elseif ($kort.value -ceq 'A') {
        $poengKortstokk = $poengKortstokk + 11  
    }
    else {
        $poengKortstokk = $poengKortstokk + $kort.value 
    }

}
Write-Output "Kortstokk: $(kortStokkTilStreng -kortstokk $kortstokk)"
Write-output "Poengsum : $poengkortstokk"