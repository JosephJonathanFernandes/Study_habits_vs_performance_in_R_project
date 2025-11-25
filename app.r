## Student Study Habits - Interactive Dashboard
## Enhanced EDA app with modern UI
## Author: Enhanced Version

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(DT))
suppressPackageStartupMessages(library(corrplot))
suppressPackageStartupMessages(library(rlang))
suppressPackageStartupMessages(library(plotly))
suppressPackageStartupMessages(library(shinythemes))
suppressPackageStartupMessages(library(bslib))

# Load data with fallback paths
file_path <- "student_study_habits.csv"
if (!file.exists(file_path)) {
  if (file.exists(file.path("Student_dataset", "student_study_habits.csv"))) {
    file_path <- file.path("Student_dataset", "student_study_habits.csv")
  } else if (file.exists(file.path("data", "raw", "student_study_habits.csv"))) {
    file_path <- file.path("data", "raw", "student_study_habits.csv")
  }
}

tryCatch({
  df <- read.csv(file_path)
}, error = function(e) {
  df <- data.frame()
  warning("Dataset not found. Please ensure 'student_study_habits.csv' is accessible.")
})

# Define UI with modern theme
ui <- fluidPage(
  theme = bs_theme(
    bootswatch = "flatly",
    primary = "#2C3E50",
    secondary = "#18BC9C",
    success = "#18BC9C",
    base_font = font_google("Roboto"),
    heading_font = font_google("Montserrat")
  ),
  
  tags$head(
    tags$style(HTML("
      .navbar { margin-bottom: 20px; }
      .well { background-color: #f8f9fa; border: 1px solid #dee2e6; }
      .box-shadow { box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
      .stat-box {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 20px;
        border-radius: 10px;
        margin: 10px 0;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      }
      .stat-value { font-size: 2em; font-weight: bold; }
      .stat-label { font-size: 0.9em; opacity: 0.9; }
    "))
  ),
  
  # Header
  div(class = "jumbotron text-center", style = "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 40px; margin-bottom: 30px; border-radius: 10px;",
    h1("📊 Student Study Habits Analytics", style = "font-weight: bold; margin-bottom: 10px;"),
    p("Interactive Exploratory Data Analysis Dashboard", style = "font-size: 1.2em; opacity: 0.9;")
  ),
  
  sidebarLayout(
    sidebarPanel(
      class = "box-shadow",
      style = "background-color: white; border-radius: 10px; padding: 20px;",
      
      conditionalPanel(
        condition = "input.tabs == 'Overview'",
        h4("📈 Dataset Overview", style = "color: #2C3E50; margin-bottom: 15px;"),
        helpText("Quick statistics and dataset information")
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Univariate'",
        h4("📊 Variable Analysis", style = "color: #2C3E50;"),
        selectInput("uni_var", "Select Variable:", choices = names(df), 
                    selected = names(df)[1]),
        hr(),
        helpText("Explore individual variable distributions")
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Bivariate'",
        h4("🔗 Relationship Analysis", style = "color: #2C3E50;"),
        selectInput("bi_var_x", "X Variable:", choices = names(df), 
                    selected = names(df)[1]),
        selectInput("bi_var_y", "Y Variable:", choices = names(df), 
                    selected = ifelse(length(names(df)) >= 5, names(df)[5], names(df)[2])),
        checkboxInput("show_trend", "Show Trend Line", value = TRUE),
        hr(),
        helpText("Analyze relationships between variables")
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Correlation'",
        h4("🎯 Correlation Matrix", style = "color: #2C3E50;"),
        selectInput("corr_method", "Method:", 
                    choices = c("Pearson" = "pearson", "Spearman" = "spearman"),
                    selected = "pearson"),
        hr(),
        helpText("Visualize correlations between all numeric variables")
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Data'",
        h4("📋 Raw Data", style = "color: #2C3E50;"),
        downloadButton("downloadData", "Download CSV", class = "btn-primary"),
        hr(),
        helpText("Browse and download the dataset")
      ),
      
      width = 3
    ),
    
    mainPanel(
      tabsetPanel(id = "tabs", type = "pills",
        tabPanel("Overview", icon = icon("home"),
          br(),
          fluidRow(
            column(6, uiOutput("stat_rows")),
            column(6, uiOutput("stat_cols"))
          ),
          fluidRow(
            column(6, uiOutput("stat_numeric")),
            column(6, uiOutput("stat_complete"))
          ),
          hr(),
          h4("📊 Quick Summary Statistics"),
          verbatimTextOutput("quickSummary"),
          hr(),
          h4("📈 Variable Types"),
          plotlyOutput("varTypePlot", height = "300px")
        ),
        
        tabPanel("Data", icon = icon("table"),
          br(),
          h4("Dataset Preview"),
          DTOutput("dataTable")
        ),
        
        tabPanel("Univariate", icon = icon("chart-bar"),
          br(),
          plotlyOutput("uniPlot", height = "500px"),
          hr(),
          h4("Statistical Summary"),
          verbatimTextOutput("uniSummary")
        ),
        
        tabPanel("Bivariate", icon = icon("chart-scatter"),
          br(),
          plotlyOutput("biPlot", height = "500px"),
          hr(),
          fluidRow(
            column(6, 
              h4("Correlation Coefficient"),
              verbatimTextOutput("biSummary")
            ),
            column(6,
              h4("Sample Sizes"),
              verbatimTextOutput("biStats")
            )
          )
        ),
        
        tabPanel("Correlation", icon = icon("circle-nodes"),
          br(),
          plotOutput("corrPlot", height = "600px")
        )
      ),
      class = "box-shadow",
      style = "background-color: white; border-radius: 10px; padding: 20px;"
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
      p <- p + geom_point(alpha = 0.6) + geom_smooth(method = "lm", se = FALSE, formula = y ~ x) +
        labs(title = paste("Scatter Plot of", input$bi_var_y, "vs", input$bi_var_x))
    } else if (is_x_binary && is_y_binary) {
      # Jitter or count for binary-binary
      p <- p + geom_jitter(width = 0.1, height = 0.1) +
        labs(title = paste("Jitter Plot of", input$bi_var_y, "vs", input$bi_var_x))
    } else {
      # Scatter for continuous-continuous
      p <- p + geom_point(alpha = 0.6, color = "darkblue") + 
        geom_smooth(method = "lm", color = "red", formula = y ~ x) +
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