@echo off
echo ========================================
echo  Student Study Habits - Enhanced Dashboard
echo ========================================
echo.
echo Installing required packages...
echo.

"C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_shiny.R

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Package installation failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo  Launching Enhanced Shiny Dashboard...
echo ========================================
echo.
echo The app will open in your browser at:
echo http://127.0.0.1:3838
echo.
echo Press Ctrl+C in the R window to stop the app
echo.

"C:\Program Files\R\R-4.4.1\bin\x64\R.exe" --no-save -f launch_improved_app.R

pause
