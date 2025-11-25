## Student Study Habits - Shiny App
## A small EDA app for a student study habits dataset
## Author: Generated improvements

library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(corrplot)
library(rlang) # for .data pronoun in ggplot tidy evaluation

# Check if file exists, if not try to find it or use a placeholder
file_path <- "student_study_habits.csv"
if (!file.exists(file_path)) {
  # Fallback for when running in a different working directory structure
  if (file.exists(file.path("Student_dataset", "student_study_habits.csv"))) {
    file_path <- file.path("Student_dataset", "student_study_habits.csv")
  }
}

# Load data
# We wrap this in a tryCatch to handle cases where the file might not be found immediately
tryCatch({
  df <- read.csv(file_path)
}, error = function(e) {
  df <- data.frame() # Empty dataframe if file not found
  warning("Dataset not found. Please ensure 'student_study_habits.csv' is in the working directory.")
})

# Define UI
ui <- fluidPage(
  titlePanel("Student Study Habits EDA"),
  
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        condition = "input.tabs == 'Univariate'",
        selectInput("uni_var", "Select Variable:", choices = names(df))
      ),
      conditionalPanel(
        condition = "input.tabs == 'Bivariate'",
        selectInput("bi_var_x", "Select X Variable:", choices = names(df), selected = names(df)[1]),
        selectInput("bi_var_y", "Select Y Variable:", choices = names(df), selected = names(df)[5])
      ),
      conditionalPanel(
        condition = "input.tabs == 'Correlation'",
        helpText("Displays correlation matrix of numeric variables.")
      ),
      width = 3
    ),
    
    mainPanel(
      tabsetPanel(id = "tabs",
        tabPanel("Data View", DTOutput("dataTable")),
        tabPanel("Summary", verbatimTextOutput("summary")),
        tabPanel("Univariate", 
                 plotOutput("uniPlot"),
                 verbatimTextOutput("uniSummary")
        ),
        tabPanel("Bivariate", 
                 plotOutput("biPlot"),
                 verbatimTextOutput("biSummary")
        ),
        tabPanel("Correlation", plotOutput("corrPlot"))
      )
    )
  )
)

# Define Server
server <- function(input, output) {
  
  # Data Table
  output$dataTable <- renderDT({
    datatable(df, options = list(scrollX = TRUE))
  })
  
  # Summary
  output$summary <- renderPrint({
    summary(df)
  })
  
  # Univariate Analysis
  output$uniPlot <- renderPlot({
    req(input$uni_var)
    var <- df[[input$uni_var]]

    # Check if variable is essentially binary (0/1) or continuous
    is_binary <- all(var %in% c(0, 1, NA))

    p <- ggplot(df, aes(x = .data[[input$uni_var]]))

    if (is_binary) {
      p <- p + geom_bar(fill = "steelblue") +
        labs(title = paste("Bar Plot of", input$uni_var), y = "Count") +
        theme_minimal()
    } else {
      p <- p + geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "skyblue", color = "black") +
        geom_density(alpha = .2, fill = "#FF6666") +
        labs(title = paste("Distribution of", input$uni_var), y = "Density") +
        theme_minimal()
    }
    print(p)
  })
  
  output$uniSummary <- renderPrint({
    req(input$uni_var)
    summary(df[[input$uni_var]])
  })
  
  # Bivariate Analysis
  output$biPlot <- renderPlot({
    req(input$bi_var_x, input$bi_var_y)
    
    x_var <- df[[input$bi_var_x]]
    y_var <- df[[input$bi_var_y]]
    
    # Determine plot type based on variable types
    is_x_binary <- all(x_var %in% c(0, 1, NA))
    is_y_binary <- all(y_var %in% c(0, 1, NA))
    
    p <- ggplot(df, aes(x = .data[[input$bi_var_x]], y = .data[[input$bi_var_y]]))

    if (is_x_binary && !is_y_binary) {
      # Boxplot if X is binary and Y is continuous
      p <- p + geom_boxplot(aes(group = .data[[input$bi_var_x]]), fill = "orange") +
        labs(title = paste("Boxplot of", input$bi_var_y, "by", input$bi_var_x))
    } else if (!is_x_binary && is_y_binary) {
      # Scatter with linear fit when Y is binary
      p <- p + geom_point(alpha = 0.6) + geom_smooth(method = "lm", se = FALSE) +
        labs(title = paste("Scatter Plot of", input$bi_var_y, "vs", input$bi_var_x))
    } else if (is_x_binary && is_y_binary) {
      # Jitter or count for binary-binary
      p <- p + geom_jitter(width = 0.1, height = 0.1) +
        labs(title = paste("Jitter Plot of", input$bi_var_y, "vs", input$bi_var_x))
    } else {
      # Scatter for continuous-continuous
      p <- p + geom_point(alpha = 0.6, color = "darkblue") + 
        geom_smooth(method = "lm", color = "red") +
        labs(title = paste("Scatter Plot of", input$bi_var_y, "vs", input$bi_var_x))
    }

    p <- p + theme_minimal()
    print(p)
  })
  
  output$biSummary <- renderPrint({
    req(input$bi_var_x, input$bi_var_y)
    cat("Correlation:", cor(df[[input$bi_var_x]], df[[input$bi_var_y]], use = "complete.obs"))
  })
  
  # Correlation Plot
  output$corrPlot <- renderPlot({
    # Select only numeric columns (which is all of them in this dataset, but good practice)
    nums <- unlist(lapply(df, is.numeric))
    M <- cor(df[, nums], use = "complete.obs")
    corrplot(M, method = "color", type = "upper", order = "hclust", 
             addCoef.col = "black", # Add coefficient of correlation
             tl.col = "black", tl.srt = 45, # Text label color and rotation
             number.cex = 0.7, # Size of coefficients
             diag = FALSE # Hide diagonal
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)