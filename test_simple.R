# Minimal test to see actual R errors
cat("Testing R environment...\n")
cat("Working directory:", getwd(), "\n\n")

# Test package loading one by one
packages <- c('readr', 'dplyr', 'janitor', 'here')
for (pkg in packages) {
  cat("Loading", pkg, "... ")
  result <- tryCatch({
    library(pkg, character.only = TRUE)
    cat("OK\n")
    TRUE
  }, error = function(e) {
    cat("FAILED:", conditionMessage(e), "\n")
    FALSE
  })
}

cat("\nChecking file...\n")
if (file.exists('data/raw/student_study_habits.csv')) {
  cat("✓ CSV exists\n")
} else {
  cat("✗ CSV missing\n")
}
