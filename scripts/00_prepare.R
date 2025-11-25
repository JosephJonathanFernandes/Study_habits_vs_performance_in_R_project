# Copies the dataset from repo root to data/raw if needed
library(here)
repo_csv <- here::here('student_study_habits.csv')
dest <- here::here('data','raw','student_study_habits.csv')
if (!file.exists(dest)) {
  if (file.exists(repo_csv)) {
    file.copy(repo_csv, dest)
    message('Copied ', repo_csv, ' -> ', dest)
  } else {
    stop('Original CSV not found at repo root: ', repo_csv)
  }
} else {
  message('Dataset already present at ', dest)
}
