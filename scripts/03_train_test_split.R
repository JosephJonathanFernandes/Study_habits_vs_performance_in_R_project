# Create reproducible train/test split and save indices/files
library(rsample)
library(here)

infile <- here('data','processed','features.csv')
train_file <- here('data','processed','train.csv')
test_file <- here('data','processed','test.csv')

if (!file.exists(infile)) stop('Run 02_feature_engineer.R first')

df <- readr::read_csv(infile, show_col_types = FALSE)
set.seed(123)
split <- initial_split(df, prop = 0.8)
train <- training(split)
test  <- testing(split)

readr::write_csv(train, train_file)
readr::write_csv(test, test_file)
message('Wrote train/test to: ', train_file, ' and ', test_file)

# Save split object for reproducibility
saveRDS(split, here('models','train_test_split.rds'))
