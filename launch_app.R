# Launch Shiny App
cat("Starting Shiny app...\n")
cat("Open your browser to: http://127.0.0.1:3838\n\n")
shiny::runApp(".", host = "127.0.0.1", port = 3838, launch.browser = TRUE)
