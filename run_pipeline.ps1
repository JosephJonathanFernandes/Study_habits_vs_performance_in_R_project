# PowerShell wrapper to run the R pipeline with proper error handling
$RScriptPath = "C:\Program Files\R\R-4.4.1\bin\Rscript.exe"
$RPath = "C:\Program Files\R\R-4.4.1\bin\R.exe"

Write-Host "=== Starting R Data Analytics Pipeline ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Install packages
Write-Host "[1/6] Installing R packages..." -ForegroundColor Yellow
& $RScriptPath packages.R
if ($LASTEXITCODE -ne 0) { Write-Host "Warning: Package install had issues (exit code: $LASTEXITCODE)" -ForegroundColor Red }

# Step 2: Data cleaning
Write-Host "[2/6] Cleaning data..." -ForegroundColor Yellow
& $RScriptPath scripts/01_load_clean.R
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: Data cleaning failed (exit code: $LASTEXITCODE)" -ForegroundColor Red; exit }

# Step 3: Feature engineering
Write-Host "[3/6] Feature engineering..." -ForegroundColor Yellow
& $RScriptPath scripts/02_feature_engineer.R
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: Feature engineering failed (exit code: $LASTEXITCODE)" -ForegroundColor Red; exit }

# Step 4: Train/test split
Write-Host "[4/6] Creating train/test split..." -ForegroundColor Yellow
& $RScriptPath scripts/03_train_test_split.R
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: Train/test split failed (exit code: $LASTEXITCODE)" -ForegroundColor Red; exit }

# Step 5: Train models
Write-Host "[5/6] Training baseline models..." -ForegroundColor Yellow
& $RScriptPath scripts/04_modeling.R
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: Modeling failed (exit code: $LASTEXITCODE)" -ForegroundColor Red; exit }

# Step 6: Render EDA (optional - may fail if rmarkdown missing)
Write-Host "[6/6] Rendering EDA notebook..." -ForegroundColor Yellow
& $RPath -e "rmarkdown::render('notebooks/01-EDA.Rmd')"
if ($LASTEXITCODE -ne 0) { Write-Host "Warning: EDA render had issues (exit code: $LASTEXITCODE)" -ForegroundColor Red }

Write-Host ""
Write-Host "=== Pipeline Complete ===" -ForegroundColor Green
Write-Host ""
Write-Host "Output files:"
Get-ChildItem -Path .\data\processed\ -ErrorAction SilentlyContinue | Format-Table Name, Length
Get-ChildItem -Path .\reports\ -ErrorAction SilentlyContinue | Format-Table Name, Length
Get-ChildItem -Path .\models\ -ErrorAction SilentlyContinue | Format-Table Name, Length

if (Test-Path .\reports\metrics.csv) {
    Write-Host ""
    Write-Host "Model Metrics:" -ForegroundColor Cyan
    Get-Content .\reports\metrics.csv
}
