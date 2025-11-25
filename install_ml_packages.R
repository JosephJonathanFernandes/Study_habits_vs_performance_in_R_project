# Install tidymodels ecosystem for ML
cat("Installing tidymodels packages for modeling...\n\n")
install.packages(c('rsample', 'tidymodels', 'ranger'), repos='https://cloud.r-project.org')
cat("\n=== Installation complete ===\n")

# Verify
cat("\nVerifying installations:\n")
for (pkg in c('rsample', 'tidymodels', 'ranger')) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat("✓", pkg, "installed\n")
  } else {
    cat("✗", pkg, "FAILED\n")
  }
}
