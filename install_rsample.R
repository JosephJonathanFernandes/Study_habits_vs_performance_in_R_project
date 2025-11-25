# Install tidymodels ecosystem packages
cat("Installing tidymodels and ranger packages...\n")
install.packages(c("tidymodels", "ranger"), repos = "https://cloud.r-project.org", dependencies = TRUE)

# Verify
packages <- c("tidymodels", "ranger")
cat("\nVerifying installations:\n")
for (pkg in packages) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat("✓", pkg, "installed successfully\n")
  } else {
    cat("✗", pkg, "installation FAILED\n")
  }
}
