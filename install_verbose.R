# Check library paths and install with verbose output
cat("=== R Library Configuration ===\n")
cat("Library paths:\n")
print(.libPaths())
cat("\n")

cat("Installing janitor and here...\n\n")
install.packages(c('janitor', 'here'), repos='https://cloud.r-project.org', verbose=TRUE)

cat("\n=== Verifying installation ===\n")
if (requireNamespace('janitor', quietly = TRUE)) {
  cat("✓ janitor installed successfully\n")
} else {
  cat("✗ janitor installation FAILED\n")
}

if (requireNamespace('here', quietly = TRUE)) {
  cat("✓ here installed successfully\n")
} else {
  cat("✗ here installation FAILED\n")
}
