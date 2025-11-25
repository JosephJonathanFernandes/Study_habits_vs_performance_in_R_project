# Test script to diagnose issues
cat("=== R is working ===\n")
cat("R version:", R.version.string, "\n")
cat("Working directory:", getwd(), "\n")

# Check if packages are available
pkgs_needed <- c('readr', 'dplyr', 'janitor', 'here')
for (pkg in pkgs_needed) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat("✓ Package", pkg, "is installed\n")
  } else {
    cat("✗ Package", pkg, "is MISSING\n")
  }
}

# Check if file exists
infile <- 'data/raw/student_study_habits.csv'
if (file.exists(infile)) {
  cat("✓ Input file exists:", infile, "\n")
  cat("  File size:", file.size(infile), "bytes\n")
} else {
  cat("✗ Input file NOT FOUND:", infile, "\n")
}

# Try loading the file
cat("\nAttempting to load CSV...\n")
tryCatch({
  library(readr)
  df <- read_csv(infile, show_col_types = FALSE)
  cat("✓ Successfully loaded", nrow(df), "rows and", ncol(df), "columns\n")
  cat("Column names:", paste(head(names(df), 5), collapse=", "), "...\n")
}, error = function(e) {
  cat("✗ ERROR loading CSV:", conditionMessage(e), "\n")
})

cat("\n=== Diagnostic complete ===\n")
