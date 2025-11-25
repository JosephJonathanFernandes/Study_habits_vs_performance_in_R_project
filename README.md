# Student Study Habits — Shiny EDA App

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)  
[![R-CMD-check](https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project/actions/workflows/r-cmd-check.yaml/badge.svg)](https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project/actions)

Lightweight Shiny app to explore a synthetic student study-habits dataset.

## Structure

- `app.r` — main Shiny application
- `student_study_habits.csv` — dataset used by the app
- `packages.R` — helper to install R package dependencies
- `run_app.ps1` — PowerShell helper to run the app on Windows

## Quick start (Windows)

Requirements

- R (>= 4.4) installed from CRAN: <https://cran.r-project.org/>

Install dependencies

1. From PowerShell, run the provided installer (adjust R path if necessary):

```powershell
& "C:\Program Files\R\R-<version>\bin\x64\Rscript.exe" packages.R
```

1. Or run `packages.R` from R/RStudio.

Run the app

```powershell
./run_app.ps1
# then open http://127.0.0.1:3838
```

Notes

- If `Rscript` is not on your PATH, `run_app.ps1` will attempt to locate R under `C:\Program Files\R`.
- If you see warnings that packages were "built under" a different R patch version, they are informational — consider reinstalling packages after upgrading R to remove them.

## Development

- The app uses modern ggplot2 tidy evaluation (`.data[[...]]`) and suppresses package startup messages for cleaner output.
- To reproduce a consistent environment, consider using `renv::init()` to create a lockfile. Example:

```r
install.packages('renv')
renv::init()
```

## CI

This repository includes a GitHub Actions workflow to run `R CMD check` on pushes and pull requests. See `.github/workflows/r-cmd-check.yaml`.

## Contributing

See `CONTRIBUTING.md` for basics.

## License

This repository is licensed under the MIT License — see `LICENSE`.

## Troubleshooting

- If you get port-in-use errors, change the port in `run_app.ps1` or kill the process using the port: `taskkill /PID <pid> /F`.
- To see runtime logs, run the `Rscript` command manually so the process runs in foreground.

## Contact

Open an issue or PR on GitHub.


