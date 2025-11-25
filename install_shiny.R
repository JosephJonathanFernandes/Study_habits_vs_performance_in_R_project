# Install Premium Shiny Dashboard Packages
cat("Installing Shiny dashboard packages...\n\n")
cat("This may take a few minutes...\n\n")

packages <- c("shiny", "shinydashboard", "DT", "corrplot", "plotly", "bslib", "scales", "ggplot2", "dplyr")

install.packages(packages, repos = "https://cloud.r-project.org", dependencies = TRUE)

cat("\n=== Installation complete ===\n\n")

# Verify installations
cat("Verifying installations:\n")
for (pkg in packages) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat("✓", pkg, "installed\n")
  } else {
    cat("✗", pkg, "FAILED\n")
  }
}

cat("\n=== All packages ready! ===\n")
