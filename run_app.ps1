<#
Run the Shiny app. This script finds `Rscript.exe` and runs the app.
Usage: .\run_app.ps1
#>
$rscript = Get-Command Rscript -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source -ErrorAction SilentlyContinue
if (-not $rscript) {
    $possible = Get-ChildItem 'C:\Program Files\R' -Directory -ErrorAction SilentlyContinue | ForEach-Object { Get-ChildItem $_.FullName -Directory -ErrorAction SilentlyContinue } | Where-Object { Test-Path (Join-Path $_.FullName 'bin\x64\Rscript.exe') } | Select-Object -First 1
    if ($possible) {
        $rscript = Join-Path $possible.FullName 'bin\x64\Rscript.exe'
    }
}
if (-not $rscript) { Write-Error 'Rscript not found. Please install R or add Rscript to PATH.'; exit 1 }
& $rscript -e "shiny::runApp('$(Resolve-Path .)', host='127.0.0.1', port=3838)"