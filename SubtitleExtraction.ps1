param (
    [string]$inputDir = "Input\",
    [string]$outputDir = "Output\"
)

Write-Host "Extracting subtitles from files."

$files = Get-ChildItem -Path "$inputDir" | Where-Object { $_.PSIsContainer -eq $false -and $_.Extension -eq ".mkv" }

foreach ($file in $files) {
    $subtitleFileName = $file.BaseName + '.ssa'
    Write-Host $file
    ffmpeg.exe -i "$inputDir\$file" -map 0:s:1 "$outputDir\$subtitleFileName"
}