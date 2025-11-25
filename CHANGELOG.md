# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-11-25

### Added

#### Premium Dashboard
- **New premium dashboard** (`app_improved.r`) with modern UI/UX
- **6 analysis modules**: Overview, Data Explorer, Univariate, Bivariate, Correlation, Advanced Analytics
- **Interactive Plotly visualizations** with zoom, pan, and hover details
- **Advanced statistical features**:
  - Normality tests (Shapiro-Wilk)
  - Multiple correlation methods (Pearson, Spearman, Kendall)
  - Box plots, Violin plots, Density plots, Q-Q plots
  - Trend lines with confidence intervals
- **Animated gradient design** with professional color schemes
- **Data completeness visualization**
- **Enhanced stat cards** with icons and hover effects
- **Customizable plot controls**: bin size, point size, opacity, trend lines

#### Machine Learning Pipeline
- **Automated ML pipeline** with batch script (`run_pipeline.bat`)
- **Train/test splitting** with rsample (80/20 split)
- **Model training**: Linear Regression and Random Forest
- **Model evaluation**: RMSE, R², MAE metrics
- **Model persistence**: Save/load trained models as .rds files

#### Documentation
- **Comprehensive README** with badges, features, and usage guide
- **Detailed CONTRIBUTING guide** with code style and workflow
- **Enhanced QUICKSTART** with step-by-step instructions
- **CHANGELOG** for tracking project evolution

#### Installation Scripts
- `install_shiny.R` - Dashboard dependencies installer
- `install_ml_packages.R` - ML ecosystem packages installer
- `run_improved_app.bat` - One-click dashboard launcher
- `setup_and_run_shiny.bat` - Combined install and launch

### Changed

- **Updated package dependencies** to include tidymodels ecosystem
- **Modernized R code** with tidyverse best practices
- **Enhanced error handling** in all scripts
- **Improved file organization** with proper directory structure

### Fixed

- **Package installation issues** with x64 R path
- **Port conflict handling** for Shiny server
- **Missing dependency errors** in pipeline execution
- **Data loading fallbacks** for multiple file locations

## [1.0.0] - 2024 (Previous Version)

### Added

- Basic Shiny EDA application (`app.r`)
- Student study habits dataset
- Simple data cleaning scripts
- Basic ML modeling scripts
- Initial README and documentation

### Features

- Data table visualization
- Basic summary statistics
- Simple univariate and bivariate plots
- Correlation matrix visualization

---

## Upcoming Features

### Planned for v2.1.0

- [ ] Add XGBoost and Neural Network models
- [ ] Implement k-fold cross-validation
- [ ] Add SHAP value interpretations
- [ ] Create Docker containerization
- [ ] Add automated testing suite
- [ ] Implement CI/CD pipeline

### Under Consideration

- [ ] Deploy to Shiny Server / RStudio Connect
- [ ] Add user authentication
- [ ] Support for multiple datasets
- [ ] Export reports to PDF
- [ ] Add time-series analysis features
- [ ] Interactive feature engineering in dashboard

---

## Version History

| Version | Date | Description |
|---------|------|-------------|
| 2.0.0 | 2025-11-25 | Major UI overhaul, ML pipeline, comprehensive docs |
| 1.0.0 | 2024 | Initial release with basic EDA features |

---

## Migration Guide

### Upgrading from v1.0.0 to v2.0.0

#### New Dependencies

Install new required packages:

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_ml_packages.R
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_shiny.R
```

#### Breaking Changes

- `run_app.ps1` now requires x64 R path
- Dashboard now runs on port 3838 by default (was configurable)
- Some function signatures changed in modeling scripts

#### Recommended Actions

1. Use the new `app_improved.r` instead of `app.r`
2. Run the full pipeline with `run_pipeline.bat`
3. Review updated documentation in README.md

---

## Acknowledgments

### Contributors

- Joseph Jonathan Fernandes - Initial work and v2.0.0 development

### Dependencies

Major packages used in this project:

- **Shiny** - Web application framework
- **tidymodels** - ML framework
- **plotly** - Interactive visualizations
- **DT** - Interactive data tables
- **bslib** - Modern Bootstrap themes
- **corrplot** - Correlation visualizations

---

**For detailed changes in each file, see the [commit history](https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project/commits/main).**
