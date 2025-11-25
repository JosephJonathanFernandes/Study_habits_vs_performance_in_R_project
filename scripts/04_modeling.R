# Baseline modeling with tidymodels: linear regression + random forest
library(tidymodels)
library(here)

train_file <- here('data','processed','train.csv')
test_file  <- here('data','processed','test.csv')

if (!file.exists(train_file) || !file.exists(test_file)) stop('Run 03_train_test_split.R first')

train <- readr::read_csv(train_file, show_col_types = FALSE)
test  <- readr::read_csv(test_file, show_col_types = FALSE)

# Simple recipe
rec <- recipe(final_grade ~ ., data = train) %>%
  step_rm(matches('participation_level_|parental_education_')) %>%
  step_normalize(all_numeric_predictors())

# Linear model
lm_spec <- linear_reg() %>% set_engine('lm')

lm_wf <- workflow() %>%
  add_recipe(rec) %>%
  add_model(lm_spec)

lm_fit <- lm_wf %>% fit(data = train)

# Random forest
rf_spec <- rand_forest(trees = 500) %>% set_engine('ranger') %>% set_mode('regression')
rf_wf <- workflow() %>% add_recipe(rec) %>% add_model(rf_spec)
rf_fit <- rf_wf %>% fit(data = train)

# Evaluate on test set
lm_preds <- predict(lm_fit, test) %>% bind_cols(test)
rf_preds <- predict(rf_fit, test) %>% bind_cols(test)

metrics <- metric_set(rmse, rsq, mae)

lm_metrics <- metrics(lm_preds, truth = final_grade, estimate = .pred) %>% mutate(model = 'linear_regression')
rf_metrics <- metrics(rf_preds, truth = final_grade, estimate = .pred) %>% mutate(model = 'random_forest')

all_metrics <- bind_rows(lm_metrics, rf_metrics)

readr::write_csv(all_metrics, here('reports','metrics.csv'))
message('Saved metrics to reports/metrics.csv')

# Save models
saveRDS(lm_fit, here('models','lm_fit.rds'))
saveRDS(rf_fit, here('models','rf_fit.rds'))
message('Saved model artifacts to models/')
