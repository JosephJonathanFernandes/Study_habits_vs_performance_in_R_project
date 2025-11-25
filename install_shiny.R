# Check and install Shiny
cat("Checking for Shiny package...\n")
if (!requireNamespace("shiny", quietly = TRUE)) {
  cat("Shiny not found. Installing...\n")
  install.packages("shiny", repos = "https://cloud.r-project.org", dependencies = TRUE)
} else {
  cat("Shiny is already installed: version", as.character(packageVersion("shiny")), "\n")
}

# Check and install DT
if (!requireNamespace("DT", quietly = TRUE)) {
  cat("DT not found. Installing...\n")
  install.packages("DT", repos = "https://cloud.r-project.org", dependencies = TRUE)
} else {
  cat("DT is already installed\n")
}

# Check and install corrplot
if (!requireNamespace("corrplot", quietly = TRUE)) {
  cat("corrplot not found. Installing...\n")
  install.packages("corrplot", repos = "https://cloud.r-project.org", dependencies = TRUE)
} else {
  cat("corrplot is already installed\n")
}

cat("\n=== Installation complete ===\n")
