# 🚀 Quick Start Guide

Complete guide to get the Student Study Habits Analysis project up and running in minutes.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Launch Dashboard](#launch-dashboard)
- [Run ML Pipeline](#run-ml-pipeline)
- [Project Workflow](#project-workflow)
- [Outputs](#outputs)
- [Troubleshooting](#troubleshooting)

## ✅ Prerequisites

### Required Software

- **R** version ≥ 4.4.1
  - Download from [CRAN](https://cran.r-project.org/)
  - Install for Windows (64-bit recommended)
  
- **PowerShell** (comes with Windows)

- **Git** (optional, for cloning)
  - Download from [git-scm.com](https://git-scm.com/)

### System Requirements

- Windows 10/11 (64-bit)
- 4GB RAM minimum (8GB recommended)
- 500MB free disk space

## 📦 Installation

### Step 1: Get the Code

**Option A: Clone with Git**

```powershell
git clone https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project.git
cd Study_habits_vs_performance_in_R_project
```

**Option B: Download ZIP**

1. Go to the GitHub repository
2. Click "Code" → "Download ZIP"
3. Extract to your desired location
4. Open PowerShell in that directory

### Step 2: Install Core Packages

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" packages.R
```

This installs:
- `readr` - Data reading
- `dplyr` - Data manipulation
- `ggplot2` - Visualization
- `tidyr` - Data tidying

### Step 3: Install ML Packages

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_ml_packages.R
```

This installs:
- `rsample` - Data splitting
- `tidymodels` - ML framework
- `ranger` - Random Forest

### Step 4: Install Dashboard Packages

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_shiny.R
```

This installs:
- `shiny` - Dashboard framework
- `shinydashboard` - Dashboard UI
- `plotly` - Interactive plots
- `DT` - Interactive tables
- `corrplot` - Correlation plots
- `bslib` - Modern themes
- `scales` - Plot scaling

## 🎨 Launch Dashboard

### One-Click Launch (Recommended)

```powershell
.\run_improved_app.bat
```

This will:
1. ✅ Verify all packages are installed
2. 🚀 Launch the premium dashboard
3. 🌐 Open your browser to http://127.0.0.1:3838

### Manual Launch

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\R.exe" --no-save -f launch_improved_app.R
```

### Dashboard Features

Once launched, explore these tabs:

1. **Overview** - Dataset statistics and metrics
2. **Data** - Interactive data table with filters
3. **Univariate** - Single variable distributions
4. **Bivariate** - Variable relationships and correlations
5. **Correlation** - Full correlation matrix heatmap
6. **Advanced** - Statistical tests and advanced plots

## 🤖 Run ML Pipeline

### Full Pipeline Execution

```powershell
.\run_pipeline.bat
```

This executes all steps in sequence:

```
[1] Testing R environment...
[2] Cleaning data...
[3] Feature engineering...
[4] Train/test split...
[5] Training models...
```

### Manual Step-by-Step Execution

If you prefer to run each step individually:

#### Step 1: Prepare Data

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" scripts/00_prepare.R
```

Copies raw data to processing directory.

#### Step 2: Clean Data

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" scripts/01_load_clean.R
```

Output: `data/processed/cleaned.csv`

#### Step 3: Engineer Features

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" scripts/02_feature_engineer.R
```

Output: `data/processed/features.csv`

#### Step 4: Create Train/Test Split

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" scripts/03_train_test_split.R
```

Outputs:
- `data/processed/train.csv` (80% of data)
- `data/processed/test.csv` (20% of data)
- `models/train_test_split.rds` (split object)

#### Step 5: Train Models

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" scripts/04_modeling.R
```

Outputs:
- `models/lm_fit.rds` (Linear Regression)
- `models/rf_fit.rds` (Random Forest)
- `reports/metrics.csv` (Performance metrics)

### Run EDA Notebook (Optional)

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" -e "rmarkdown::render('notebooks/01-EDA.Rmd')"
```

Generates HTML report with exploratory analysis.

## 📂 Project Workflow

### Typical Development Workflow

1. **Data Exploration** - Use dashboard to understand data
2. **Feature Engineering** - Modify `02_feature_engineer.R`
3. **Model Training** - Run pipeline to train models
4. **Evaluation** - Check `reports/metrics.csv`
5. **Iteration** - Adjust features/models and repeat

### Working with New Data

1. Place new CSV in `data/raw/`
2. Update file path in scripts
3. Run pipeline: `.\run_pipeline.bat`
4. Launch dashboard: `.\run_improved_app.bat`

## 📊 Outputs

### Data Files

| File | Location | Description |
|------|----------|-------------|
| `cleaned.csv` | `data/processed/` | Clean data with NA handling |
| `features.csv` | `data/processed/` | Engineered features |
| `train.csv` | `data/processed/` | Training set (80%) |
| `test.csv` | `data/processed/` | Test set (20%) |

### Model Artifacts

| File | Location | Description |
|------|----------|-------------|
| `lm_fit.rds` | `models/` | Linear regression model |
| `rf_fit.rds` | `models/` | Random forest model |
| `train_test_split.rds` | `models/` | Split object for reproducibility |

### Reports

| File | Location | Description |
|------|----------|-------------|
| `metrics.csv` | `reports/` | Model performance metrics (RMSE, R², MAE) |

### Expected Metrics

After running the pipeline, you should see:

```csv
.metric,.estimator,.estimate,model
rmse,standard,4.32,linear_regression
rsq,standard,0.596,linear_regression
mae,standard,3.51,linear_regression
rmse,standard,4.39,random_forest
rsq,standard,0.595,random_forest
mae,standard,3.64,random_forest
```

## 🔧 Troubleshooting

### Common Issues

#### Issue: "Rscript not found"

**Solution:** Specify full path to R installation

```powershell
# Check your R version and adjust path
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" --version
```

#### Issue: "Port 3838 already in use"

**Solution:** Find and kill the process

```powershell
# Find process using port 3838
netstat -ano | findstr :3838

# Kill the process (replace <PID> with actual process ID)
taskkill /PID <PID> /F
```

Or change the port in `launch_improved_app.R`:

```r
shiny::runApp("app_improved.r", host = "127.0.0.1", port = 8080, launch.browser = TRUE)
```

#### Issue: "Package installation failed"

**Solution:** Install packages with verbose output

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_verbose.R
```

Or install manually in R console:

```r
install.packages(c("shiny", "plotly", "DT", "tidymodels"), 
                 repos = "https://cloud.r-project.org",
                 dependencies = TRUE)
```

#### Issue: "Missing package 'rsample'"

**Solution:** Run ML package installer

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_ml_packages.R
```

#### Issue: Package version warnings

Warnings like `package 'dplyr' was built under R version 4.4.3` are informational only.

**Solution (optional):** Update packages

```r
update.packages(ask = FALSE, checkBuilt = TRUE)
```

#### Issue: Dashboard won't open in browser

**Solution:**

1. Check firewall settings
2. Manually open: http://127.0.0.1:3838
3. Try different browser
4. Check R console for errors

### Getting Help

If you encounter other issues:

1. Check the [main README](../README.md)
2. Review error messages carefully
3. Search existing [GitHub Issues](https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project/issues)
4. Open a new issue with:
   - Error message
   - Steps to reproduce
   - R version (`R.version.string`)
   - OS version

## 🎓 Next Steps

After completing the quick start:

1. **Explore the Dashboard** - Interact with all tabs
2. **Review the Code** - Check `scripts/` directory
3. **Modify Features** - Edit `scripts/02_feature_engineer.R`
4. **Add Models** - Extend `scripts/04_modeling.R`
5. **Customize UI** - Modify `app_improved.r`

## 📚 Additional Resources

- [Main README](../README.md) - Comprehensive project overview
- [Contributing Guide](../CONTRIBUTING.md) - How to contribute
- [R Documentation](https://www.r-project.org/)
- [Shiny Tutorial](https://shiny.rstudio.com/tutorial/)
- [Tidymodels Guide](https://www.tidymodels.org/start/)

---

**🎉 You're all set! Happy analyzing!**
