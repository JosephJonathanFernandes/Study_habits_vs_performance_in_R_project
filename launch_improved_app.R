# Launch Improved Shiny App
cat("Starting Enhanced Shiny Dashboard...\n")
cat("Open your browser to: http://127.0.0.1:3838\n\n")
shiny::runApp("app_improved.r", host = "127.0.0.1", port = 3838, launch.browser = TRUE)
