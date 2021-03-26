# .\cpshelper.ps1 <lowest number to say> <highest number to say> <number of seconds between numbers spoken> <number of times to speak numbers>
param([Int32]$start=1, [Int32]$end=6, [Int32]$gap=4, [Int32]$iterations=3)

Add-Type -AssemblyName System.Speech
$synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer

$dict = @{}
$dict.Add(1, 'one')
$dict.Add(2, 'two')
$dict.Add(3, 'three')
$dict.Add(4, 'four')
$dict.Add(5, 'five')
$dict.Add(6, 'six')
$dict.Add(7, 'seven')
$dict.Add(8, 'eight')
$dict.Add(9, 'nine')


$i = 1
Do {
    Start-Sleep -Seconds $gap
    $numberToSay = Get-Random -Minimum $start -Maximum ($end+1)
    $synth.Speak($dict[$numberToSay])
    $i++
}
While ($i -le $iterations)