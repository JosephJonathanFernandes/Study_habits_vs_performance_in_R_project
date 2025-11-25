# Load and do basic cleaning
library(readr)
library(dplyr)
library(janitor)
library(here)

infile <- here('data','raw','student_study_habits.csv')
outfile <- here('data','processed','cleaned.csv')

if (!file.exists(infile)) {
  stop('Input file not found. Run scripts/00_prepare.R to copy dataset into data/raw/')
}

df <- read_csv(infile, show_col_types = FALSE)

# Basic cleaning: clean names, remove exact duplicate rows
cleaned <- df %>%
  janitor::clean_names() %>%
  distinct()

# Convert obvious 0/1 columns to logical where appropriate (keep numeric for modeling)
# Save cleaned dataset
readr::write_csv(cleaned, outfile)
message('Wrote cleaned data to: ', outfile)
