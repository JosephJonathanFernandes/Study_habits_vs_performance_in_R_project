@echo off
echo Installing Shiny and dependencies...
echo.

"C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_shiny.R

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Installation failed
    pause
    exit /b 1
)

echo.
echo === Installation complete ===
echo.
echo Now launching Shiny app...
echo.

"C:\Program Files\R\R-4.4.1\bin\x64\R.exe" --no-save -f launch_app.R

pause
