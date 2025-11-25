# Install packages required by the app (run with Rscript)
pkgs <- c('shiny','ggplot2','dplyr','DT','corrplot','rlang')
installed <- rownames(installed.packages())
to_install <- pkgs[!pkgs %in% installed]
if (length(to_install) > 0) {
  install.packages(to_install, repos = 'https://cloud.r-project.org')
} else {
  message('All packages already installed')
}
