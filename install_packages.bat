@echo off
echo Installing R packages required for the pipeline...
echo.

"C:\Program Files\R\R-4.4.1\bin\Rscript.exe" install_rsample.R

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Package installation failed
    pause
    exit /b 1
)

echo.
echo === Package installation complete ===
pause
