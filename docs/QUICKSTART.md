Quickstart
=========

1. Install required R packages:

```powershell
Rscript packages.R
```

2. Prepare dataset (copy into data/raw):

```powershell
Rscript scripts/00_prepare.R
```

3. Run data prep and EDA:

```powershell
Rscript scripts/01_load_clean.R
Rscript scripts/02_feature_engineer.R
Rscript R -e "rmarkdown::render('notebooks/01-EDA.Rmd')"
```

4. Train baseline models:

```powershell
Rscript scripts/03_train_test_split.R
Rscript scripts/04_modeling.R
```

Outputs:
- `data/processed/` contains cleaned/features/train/test CSVs
- `reports/metrics.csv` contains test-set metrics
- `models/` contains saved RDS model artifacts
