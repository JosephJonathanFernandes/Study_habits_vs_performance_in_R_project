@echo off
echo === R Pipeline Runner (Batch) ===
echo.

set RSCRIPT="C:\Program Files\R\R-4.4.1\bin\Rscript.exe"
set R="C:\Program Files\R\R-4.4.1\bin\R.exe"

echo [1] Testing R...
%RSCRIPT% test_simple.R
if errorlevel 1 (
    echo ERROR in test - check if packages are installed
    pause
    exit /b 1
)
echo.

echo [2] Cleaning data...
%RSCRIPT% scripts/01_load_clean.R
if errorlevel 1 (
    echo ERROR in data cleaning
    pause
    exit /b 1
)
echo.

echo [3] Feature engineering...
%RSCRIPT% scripts/02_feature_engineer.R
if errorlevel 1 (
    echo ERROR in feature engineering
    pause
    exit /b 1
)
echo.

echo [4] Train/test split...
%RSCRIPT% scripts/03_train_test_split.R
if errorlevel 1 (
    echo ERROR in train/test split
    pause
    exit /b 1
)
echo.

echo [5] Training models...
%RSCRIPT% scripts/04_modeling.R
if errorlevel 1 (
    echo ERROR in modeling
    pause
    exit /b 1
)
echo.

echo === Pipeline Complete ===
echo.
echo Output files:
dir /b data\processed
dir /b models
dir /b reports
echo.
if exist reports\metrics.csv (
    echo Model Metrics:
    type reports\metrics.csv
)
pause
