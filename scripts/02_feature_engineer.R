# Simple feature engineering
library(dplyr)
library(here)

infile <- here('data','processed','cleaned.csv')
outfile <- here('data','processed','features.csv')

if (!file.exists(infile)) stop('Run 01_load_clean.R first')

df <- readr::read_csv(infile, show_col_types = FALSE)

# Example features: scale numeric predictors, create study_hours_per_day if weekly is present
df2 <- df %>%
  mutate(
    study_hours_per_day = if_else(!is.na(study_hours_per_week), study_hours_per_week / 7, NA_real_),
    assignments_completed = as.numeric(assignments_completed)
  )

readr::write_csv(df2, outfile)
message('Wrote features to: ', outfile)
