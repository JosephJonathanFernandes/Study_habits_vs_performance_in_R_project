# 📊 Student Study Habits Analysis & Interactive Dashboard

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![R Version](https://img.shields.io/badge/R-%3E%3D%204.4.1-blue)](https://cran.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-Dashboard-purple)](https://shiny.rstudio.com/)
[![Status](https://img.shields.io/badge/Status-Production%20Ready-success)]()
[![Contributions](https://img.shields.io/badge/Contributions-Welcome-brightgreen)](./CONTRIBUTING.md)

> **A production-ready data science project analyzing student study habits and their correlation with academic performance, featuring a premium interactive dashboard and complete automated ML pipeline.**

<div align="center">
  <img src="https://img.shields.io/badge/Built%20With-R-blue?style=for-the-badge&logo=r" alt="R"/>
  <img src="https://img.shields.io/badge/ML-tidymodels-orange?style=for-the-badge" alt="tidymodels"/>
  <img src="https://img.shields.io/badge/UI-Shiny-purple?style=for-the-badge" alt="Shiny"/>
</div>

---

## 🌟 Key Features

### 🎨 Premium Interactive Dashboard
- **Modern UI/UX** - Gradient designs, smooth animations, professional typography
- **6 Analysis Modules** - Overview, Data Explorer, Univariate, Bivariate, Correlation, Advanced
- **Interactive Visualizations** - Plotly-powered charts with zoom, pan, hover tooltips
- **Advanced Analytics** - Normality tests, Q-Q plots, violin plots, trend analysis
- **Data Management** - Filter, sort, and export datasets in real-time
- **Responsive Design** - Beautiful on all screen sizes

### 🤖 Complete ML Pipeline
- **Automated Workflow** - One-command execution from data to models
- **Dual Models** - Linear Regression & Random Forest with comparison
- **Rigorous Evaluation** - RMSE, R², MAE metrics with cross-validation ready
- **Reproducible Research** - Seed-based splitting, version control ready
- **Artifact Management** - All models and data saved for deployment

### 📊 Comprehensive Analysis
- **Distribution Analysis** - Customizable histograms with density overlays
- **Correlation Studies** - Pearson, Spearman, Kendall methods
- **Statistical Testing** - Shapiro-Wilk normality tests, significance testing
- **Relationship Mapping** - Scatter plots with confidence intervals
- **Missing Data Viz** - Completeness charts and gap analysis

---

## 🚀 Quick Start

### Prerequisites

| Requirement | Version | Download Link |
|------------|---------|---------------|
| **R** | ≥ 4.4.1 | [CRAN](https://cran.r-project.org/) |
| **Windows** | 10/11 (64-bit) | - |
| **RAM** | 4GB minimum | - |
| **Disk Space** | 500MB free | - |

### Installation

**1️⃣ Clone the Repository**
```powershell
git clone https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project.git
cd Study_habits_vs_performance_in_R_project
```

**2️⃣ Install Core Packages**
```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" packages.R
```

---

## 🎯 Usage

### Launch Premium Dashboard

**🔥 Recommended: One-Click Launch**
```powershell
.\run_improved_app.bat
```

This will:
1. ✅ Install all required Shiny packages
2. 🚀 Launch the dashboard server
3. 🌐 Open browser to http://127.0.0.1:3838

**Alternative: Manual Launch**
```powershell
# Install dashboard packages
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_shiny.R

# Launch app
& "C:\Program Files\R\R-4.4.1\bin\x64\R.exe" --no-save -f launch_improved_app.R
```

### Run ML Pipeline

**Execute Complete Pipeline**
```powershell
.\run_pipeline.bat
```
---

## 🎨 Dashboard Features

### 📈 Overview Tab

- **Key Metrics Cards** - Animated stat cards showing observations, variables, completeness
- **Summary Statistics** - Comprehensive statistical overview of all variables
- **Visual Analytics** - Interactive pie charts for variable types and data completeness
- **Missing Data Analysis** - Stacked bar charts showing complete vs missing data per variable

### 📋 Data Explorer Tab

- **Interactive DataTable** - Sortable, filterable, searchable data grid
- **Column Filters** - Individual filters for each column
- **Export Functionality** - Download complete or filtered datasets as CSV
- **Responsive Design** - Smooth scrolling for large datasets
- **Custom Styling** - Professional color scheme with hover effects

### 📊 Univariate Analysis Tab

- **Distribution Plots** - Interactive histograms with customizable bins (10-50)
- **Density Overlays** - Toggle-able kernel density estimation curves
- **Statistical Metrics** - Mean, median, std dev, variance, IQR, skewness
- **Data Quality Info** - Missing values, unique values, completeness percentage
- **Automatic Plot Types** - Bar charts for binary, histograms for continuous

### 🔗 Bivariate Analysis Tab

- **Smart Plot Selection** - Automatically chooses box plots or scatter plots
- **Trend Lines** - Linear regression lines with optional 95% confidence intervals
- **Interactive Controls** - Adjust point size (3-15px) and opacity (0.1-1.0)
- **Correlation Analysis** - Pearson r, r², strength interpretation
- **Model Statistics** - Slope, intercept, R², p-values
- **Sample Information** - Complete pairs, missing pairs, completeness percentage

### 🎯 Correlation Matrix Tab

- **Heat Map Visualization** - Color-coded correlation matrix
- **Multiple Methods** - Pearson (linear), Spearman (monotonic), Kendall (ordinal)
- **Ordering Algorithms** - Hierarchical clustering, Principal Component, Original
- **Toggle Coefficients** - Show/hide correlation values on heat map
- **Professional Palette** - Purple-white-blue gradient for visual clarity

### 🔬 Advanced Analytics Tab

- **Multiple Plot Types:**
  - **Box Plots** - Distribution with outliers and quartiles
  - **Violin Plots** - Density + box plot combination
  - **Density Plots** - Smooth distribution curves
  - **Q-Q Plots** - Normality assessment vs theoretical quantiles
- **Normality Testing** - Shapiro-Wilk test with statistical interpretation
- **Comprehensive Stats** - Mean, median, std dev, variance, range, IQR, min, max
- **Skewness Analysis** - Distribution asymmetry assessment

---

## 🤖 Machine Learning Pipeline

### Pipeline Architecture

```
Input Data → Cleaning → Feature Engineering → Train/Test Split → Modeling → Evaluation
```

### Execution Steps

**Stage 1: Environment Validation**
- Verifies R installation and version
- Checks required packages (readr, dplyr, tidymodels, ranger)
- Validates data file existence
- Sets working directory

**Stage 2: Data Cleaning** (`01_load_clean.R`)
- Loads raw CSV data
- Handles missing values
- Removes duplicates
- Validates data types
- Outputs: `data/processed/cleaned.csv`

**Stage 3: Feature Engineering** (`02_feature_engineer.R`)
- Creates derived variables
- Scales/normalizes features as needed
- Encodes categorical variables
- Outputs: `data/processed/features.csv`

**Stage 4: Train/Test Split** (`03_train_test_split.R`)
- Reproducible 80/20 split (seed=123)
- Uses rsample::initial_split()
- Saves split object for reproducibility
- Outputs: `train.csv`, `test.csv`, `train_test_split.rds`

**Stage 5: Model Training** (`04_modeling.R`)
- **Linear Regression** - Fast, interpretable baseline
- **Random Forest** - Ensemble method for comparison
- Hyperparameter tuning ready
- Outputs: `lm_fit.rds`, `rf_fit.rds`

**Stage 6: Evaluation**
- RMSE (Root Mean Square Error)
- R² (Coefficient of Determination)
- MAE (Mean Absolute Error)
- Outputs: `reports/metrics.csv`

### Model Performance

Recent pipeline results on student performance dataset:

| Model | RMSE ⬇️ | R² ⬆️ | MAE ⬇️ | Training Time |
|-------|---------|-------|--------|---------------|
| **Linear Regression** | 4.32 | 0.596 | 3.51 | < 1s |
| **Random Forest** | 4.39 | 0.595 | 3.64 | ~3s |

**Interpretation:**
- ✅ Linear Regression performs marginally better (lower RMSE and MAE)
- ✅ Both models explain ~60% of variance in academic performance
- ✅ Warning: "rank-deficient fit" suggests multicollinearity - consider feature selection

---

## 📊 Technologies & Packages

### Core Technologies

| Technology | Purpose | Version |
|-----------|---------|---------|
| **R** | Statistical computing | ≥ 4.4.1 |
| **Shiny** | Interactive web applications | ≥ 1.7.0 |
| **tidymodels** | ML framework | Latest |
| **plotly** | Interactive visualizations | Latest |

### R Package Dependencies

**Data Manipulation:**
- `dplyr` - Data transformation
- `tidyr` - Data tidying
- `readr` - Fast CSV reading

**Visualization:**
- `ggplot2` - Static plots
- `plotly` - Interactive plots
- `corrplot` - Correlation matrices
- `scales` - Scale functions

**Machine Learning:**
- `tidymodels` - ML workflow
- `rsample` - Data splitting
- `parsnip` - Model interface
- `yardstick` - Metrics
- `ranger` - Random forest implementation

**Dashboard:**
- `shiny` - Web framework
- `shinydashboard` - Dashboard layout
- `DT` - Interactive tables
- `bslib` - Bootstrap themes

---

## 🚀 Deployment

### Local Deployment

The dashboard runs locally on `http://127.0.0.1:3838` by default.

**Custom Port:**
```r
shiny::runApp("app_improved.r", host = "127.0.0.1", port = 8080, launch.browser = TRUE)
```

### Production Deployment Options

**1. Shiny Server (Open Source)**
```bash
# Deploy to /srv/shiny-server/student-habits/
sudo cp -r * /srv/shiny-server/student-habits/
sudo systemctl restart shiny-server
```

**2. ShinyApps.io (Cloud)**
```r
library(rsconnect)
rsconnect::deployApp(appDir = ".", appName = "student-habits-analysis")
```

**3. Docker Container**
```dockerfile
FROM rocker/shiny:latest
RUN R -e "install.packages(c('shiny', 'plotly', 'DT', 'corrplot'))"
COPY app_improved.r /srv/shiny-server/
EXPOSE 3838
CMD ["/usr/bin/shiny-server"]
```

---

## 🧪 Testing

### Run Tests

```powershell
# Simple diagnostic test
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" test_simple.R

# Test diagnostic script
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" scripts\test_diagnostic.R
```

### Test Coverage

- ✅ Data loading and validation
- ✅ Package availability checks
- ✅ Pipeline execution
- ✅ Model training and evaluation

---

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

**Quick Contribution Steps:**
1. 🍴 Fork the repository
2. 🔧 Create a feature branch (`git checkout -b feature/amazing-feature`)
3. 💻 Make your changes
4. ✅ Test thoroughly
5. 📝 Commit (`git commit -m 'Add amazing feature'`)
6. 🚀 Push (`git push origin feature/amazing-feature`)
7. 🎉 Open a Pull Request

---

## 📝 License

This project is licensed under the **MIT License** - see the [LICENSE](./LICENSE) file for details.

```
MIT License - Free to use, modify, and distribute
```

---

## 👨‍💻 Author

**Joseph Jonathan Fernandes**
- GitHub: [@JosephJonathanFernandes](https://github.com/JosephJonathanFernandes)
- Repository: [Study_habits_vs_performance_in_R_project](https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project)

---

## 🙏 Acknowledgments

- **R Core Team** - For the R language
- **RStudio** - For Shiny framework
- **Tidymodels Team** - For modern ML tools
- **Plotly Team** - For interactive visualizations
- **Open Source Community** - For countless packages and inspiration

---

## 📚 Additional Resources

- 📖 [R for Data Science](https://r4ds.had.co.nz/)
- 📖 [Shiny Documentation](https://shiny.rstudio.com/)
- 📖 [Tidymodels Documentation](https://www.tidymodels.org/)
- 📖 [Project Wiki](https://github.com/JosephJonathanFernandes/Study_habits_vs_performance_in_R_project/wiki)

---

## 📞 Support

Having issues? Please check:

1. **Documentation** - Review this README and QUICKSTART.md
2. **Issues Tab** - Search existing issues
3. **Create Issue** - Open a new issue with:
   - Clear description
   - Steps to reproduce
   - Environment details (R version, OS)
   - Error messages/screenshots

---

## 🗺️ Roadmap

### Upcoming Features

- [ ] 📱 Mobile-responsive dashboard improvements
- [ ] 🔐 User authentication and multi-user support
- [ ] 📊 Additional ML models (XGBoost, Neural Networks)
- [ ] 🎯 Automated hyperparameter tuning
- [ ] 📈 Real-time data updates
- [ ] 🌍 Multi-language support
- [ ] 📤 Export reports as PDF/HTML
- [ ] 🔔 Email notifications for pipeline completion

### Version History

- **v2.0.0** - Premium dashboard with advanced analytics
- **v1.5.0** - ML pipeline automation
- **v1.0.0** - Initial release with basic Shiny app

---

<div align="center">

**⭐ Star this repository if you found it helpful!**

Made with ❤️ and R

</div>

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Quick contribution workflow:**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Documentation

- **[QUICKSTART.md](docs/QUICKSTART.md)** - Detailed setup and usage guide
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Contribution guidelines
- **[LICENSE](LICENSE)** - MIT License details

## 🐛 Troubleshooting

### Port Already in Use
```powershell
# Change port in launch_improved_app.R or kill process
netstat -ano | findstr :3838
taskkill /PID <pid> /F
```

### Package Installation Errors
```powershell
# Reinstall packages with verbose output
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_verbose.R
```

### R Version Warnings
Package warnings about R versions are informational. To remove:
```r
update.packages(ask = FALSE, checkBuilt = TRUE)
```

### Dashboard Won't Launch
1. Ensure Shiny packages are installed: `.\run_improved_app.bat`
2. Check R path is correct (x64 folder)
3. Verify port 3838 is available
4. Check firewall settings

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Joseph Jonathan Fernandes**
- GitHub: [@JosephJonathanFernandes](https://github.com/JosephJonathanFernandes)

## 🙏 Acknowledgments

- Built with [R](https://www.r-project.org/) and [Shiny](https://shiny.rstudio.com/)
- Uses [Plotly](https://plotly.com/r/) for interactive visualizations
- Powered by [tidymodels](https://www.tidymodels.org/) ecosystem
- UI enhanced with [bslib](https://rstudio.github.io/bslib/)

## 📊 Dataset

The dataset contains student study habits and performance metrics including:
- Study hours per week
- Class attendance
- Sleep hours
- Exam scores
- Additional behavioral indicators

*Note: This is a synthetic dataset created for educational purposes.*

## 🔮 Future Enhancements

- [ ] Add more ML models (XGBoost, Neural Networks)
- [ ] Implement cross-validation
- [ ] Add model interpretation (SHAP values)
- [ ] Create Docker container
- [ ] Add automated testing suite
- [ ] Deploy to cloud (Shiny Server, RStudio Connect)

---

<div align="center">

**⭐ Star this repo if you find it helpful!**

Made with ❤️ and R

</div>


