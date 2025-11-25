# Student Study Habits — Shiny EDA App

Lightweight Shiny app to explore a synthetic student study-habits dataset.

## Structure
- `app.r` — main Shiny application
- `student_study_habits.csv` — dataset used by the app
- `packages.R` — helper to install R package dependencies
- `run_app.ps1` — PowerShell helper to run the app on Windows

## Quick start (Windows)

1. Install R from CRAN: https://cran.r-project.org/
2. (Optional) Make `Rscript` available in PATH or use full path to `Rscript.exe`.
3. From the project folder, install R packages:

```powershell
& "C:\Program Files\R\R-<version>\bin\x64\Rscript.exe" packages.R
```

Or run the packages.R file from R/RStudio.

4. Start the app (PowerShell):

```powershell
./run_app.ps1
```

Then open http://127.0.0.1:3838 in your browser.

## Development notes
- The app uses `ggplot2` and `shiny`. Some messages about packages built under different patch versions are normal.
- The code uses tidy evaluation (`.data[[...]]`) to avoid deprecated `aes_string()` usage.

## Contributing
See `CONTRIBUTING.md` for basics.

## License
This repository is licensed under the MIT License — see `LICENSE`.
