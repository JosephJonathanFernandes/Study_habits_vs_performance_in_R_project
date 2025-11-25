# Load and do basic cleaning
library(readr)
library(dplyr)

infile <- 'data/raw/student_study_habits.csv'
outfile <- 'data/processed/cleaned.csv'

if (!file.exists(infile)) {
  stop('Input file not found. Run scripts/00_prepare.R to copy dataset into data/raw/')
}

df <- read_csv(infile, show_col_types = FALSE)

# Basic cleaning: clean names (replace janitor with base R), remove exact duplicate rows
names(df) <- tolower(names(df))
names(df) <- gsub("[^a-z0-9_]", "_", names(df))
names(df) <- gsub("_{2,}", "_", names(df))
names(df) <- gsub("^_|_$", "", names(df))

cleaned <- df %>% distinct()

# Save cleaned dataset
readr::write_csv(cleaned, outfile)
message('Wrote cleaned data to: ', outfile)
