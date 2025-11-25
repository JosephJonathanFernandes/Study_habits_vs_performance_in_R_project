# Install missing packages
cat("Installing missing packages...\n")
pkgs <- c('janitor', 'here', 'skimr', 'naniar', 'tidymodels', 'rsample', 'ranger', 'rmarkdown')
install.packages(pkgs, repos='https://cloud.r-project.org')
cat("Installation complete!\n")
