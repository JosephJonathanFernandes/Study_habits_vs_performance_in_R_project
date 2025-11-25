## Student Study Habits - Premium Interactive Dashboard
## Professional EDA app with enhanced UI/UX
## Author: Premium Version 2.0

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(shinydashboard))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(DT))
suppressPackageStartupMessages(library(corrplot))
suppressPackageStartupMessages(library(rlang))
suppressPackageStartupMessages(library(plotly))
suppressPackageStartupMessages(library(bslib))
suppressPackageStartupMessages(library(scales))

# Load data with intelligent fallback
file_path <- "student_study_habits.csv"
alternative_paths <- c(
  "student_study_habits.csv",
  "Student_dataset/student_study_habits.csv",
  "data/raw/student_study_habits.csv"
)

for (path in alternative_paths) {
  if (file.exists(path)) {
    file_path <- path
    break
  }
}

tryCatch({
  df <- read.csv(file_path)
  data_loaded <- TRUE
}, error = function(e) {
  df <- data.frame()
  data_loaded <- FALSE
  warning("Dataset not found. Please ensure 'student_study_habits.csv' is accessible.")
})

# Define UI with premium modern theme
ui <- fluidPage(
  theme = bs_theme(
    version = 5,
    bootswatch = "lux",
    primary = "#3498db",
    secondary = "#2ecc71",
    success = "#27ae60",
    info = "#3498db",
    warning = "#f39c12",
    danger = "#e74c3c",
    base_font = font_google("Open Sans"),
    heading_font = font_google("Raleway"),
    code_font = font_google("Fira Code")
  ),
  
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600;700&family=Open+Sans:wght@300;400;600&display=swap');
      
      body { 
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        font-family: 'Open Sans', sans-serif;
      }
      
      .main-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 50px 30px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        margin-bottom: 30px;
        text-align: center;
        position: relative;
        overflow: hidden;
      }
      
      .main-header::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        animation: pulse 15s ease-in-out infinite;
      }
      
      @keyframes pulse {
        0%, 100% { transform: scale(1); opacity: 0.5; }
        50% { transform: scale(1.1); opacity: 0.8; }
      }
      
      .main-header h1 {
        font-family: 'Raleway', sans-serif;
        font-weight: 700;
        margin: 0;
        font-size: 3em;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        position: relative;
        z-index: 1;
      }
      
      .main-header p {
        font-size: 1.3em;
        opacity: 0.95;
        margin-top: 10px;
        position: relative;
        z-index: 1;
      }
      
      .sidebar {
        background: white;
        border-radius: 15px;
        padding: 25px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
      }
      
      .sidebar:hover {
        box-shadow: 0 8px 30px rgba(0,0,0,0.15);
        transform: translateY(-2px);
      }
      
      .main-content {
        background: white;
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        min-height: 600px;
      }
      
      .stat-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 25px;
        border-radius: 15px;
        margin: 15px 5px;
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        transition: all 0.3s ease;
        text-align: center;
        position: relative;
        overflow: hidden;
      }
      
      .stat-card::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.15) 0%, transparent 70%);
      }
      
      .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
      }
      
      .stat-card.purple { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
      .stat-card.pink { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
      .stat-card.blue { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
      .stat-card.green { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }
      .stat-card.orange { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }
      .stat-card.teal { background: linear-gradient(135deg, #30cfd0 0%, #330867 100%); }
      
      .stat-value {
        font-size: 2.8em;
        font-weight: 700;
        margin: 10px 0;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        position: relative;
      }
      
      .stat-label {
        font-size: 1em;
        opacity: 0.95;
        font-weight: 300;
        letter-spacing: 1px;
        position: relative;
      }
      
      .stat-icon {
        font-size: 2.5em;
        opacity: 0.3;
        position: absolute;
        right: 20px;
        top: 50%;
        transform: translateY(-50%);
      }
      
      .nav-pills .nav-link {
        border-radius: 10px;
        margin: 5px 0;
        transition: all 0.3s ease;
        font-weight: 500;
      }
      
      .nav-pills .nav-link:hover {
        transform: translateX(5px);
        background-color: #f8f9fa;
      }
      
      .nav-pills .nav-link.active {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
      }
      
      .form-control, .form-select {
        border-radius: 10px;
        border: 2px solid #e9ecef;
        padding: 10px 15px;
        transition: all 0.3s ease;
      }
      
      .form-control:focus, .form-select:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
      }
      
      .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        border-radius: 10px;
        padding: 10px 25px;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
      }
      
      .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
      }
      
      h4 {
        font-family: 'Raleway', sans-serif;
        font-weight: 600;
        color: #2c3e50;
        margin-bottom: 20px;
      }
      
      .section-divider {
        height: 3px;
        background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        border: none;
        border-radius: 2px;
        margin: 25px 0;
      }
      
      .plot-container {
        background: white;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      }
      
      .info-box {
        background: linear-gradient(135deg, #e0f7fa 0%, #b2ebf2 100%);
        border-left: 4px solid #00acc1;
        padding: 15px;
        border-radius: 8px;
        margin: 15px 0;
      }
      
      .dataTables_wrapper {
        font-size: 0.95em;
      }
      
      .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
        border: none !important;
        color: white !important;
      }
      
      .checkbox-label {
        font-weight: 500;
        color: #495057;
      }
      
      ::selection {
        background: #667eea;
        color: white;
      }
      
      .loading {
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 3px solid rgba(102, 126, 234, 0.3);
        border-radius: 50%;
        border-top-color: #667eea;
        animation: spin 1s ease-in-out infinite;
      }
      
      @keyframes spin {
        to { transform: rotate(360deg); }
      }
    "))
  ),
  
  # Premium Header
  div(class = "main-header",
    h1("📊 Student Study Habits Analytics"),
    p("Professional Interactive Data Analysis Dashboard • Powered by R Shiny")
  ),
  
  sidebarLayout(
    sidebarPanel(
      class = "sidebar",
      
      conditionalPanel(
        condition = "input.tabs == 'Overview'",
        div(
          h4("📈 Dashboard Overview"),
          div(class = "info-box",
            icon("info-circle"), " Get insights into your dataset with key metrics and visualizations"
          )
        )
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Univariate'",
        h4("📊 Variable Analysis"),
        selectInput("uni_var", 
                    label = "Select Variable:", 
                    choices = names(df), 
                    selected = names(df)[1]),
        checkboxInput("show_density", "Show Density Curve", value = TRUE),
        sliderInput("bins", "Number of Bins:", 
                    min = 10, max = 50, value = 30, step = 5),
        hr(class = "section-divider"),
        div(class = "info-box",
          icon("chart-bar"), " Explore individual variable distributions and statistics"
        )
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Bivariate'",
        h4("🔗 Relationship Explorer"),
        selectInput("bi_var_x", 
                    label = "X-Axis Variable:", 
                    choices = names(df), 
                    selected = names(df)[1]),
        selectInput("bi_var_y", 
                    label = "Y-Axis Variable:", 
                    choices = names(df), 
                    selected = ifelse(length(names(df)) >= 5, names(df)[5], names(df)[2])),
        checkboxInput("show_trend", "Show Trend Line", value = TRUE),
        checkboxInput("show_confidence", "Show Confidence Interval", value = FALSE),
        sliderInput("point_size", "Point Size:", 
                    min = 3, max = 15, value = 8, step = 1),
        sliderInput("transparency", "Point Opacity:", 
                    min = 0.1, max = 1, value = 0.6, step = 0.1),
        hr(class = "section-divider"),
        div(class = "info-box",
          icon("chart-scatter"), " Analyze relationships and correlations between variables"
        )
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Correlation'",
        h4("🎯 Correlation Matrix"),
        selectInput("corr_method", 
                    label = "Correlation Method:", 
                    choices = c("Pearson" = "pearson", 
                               "Spearman" = "spearman", 
                               "Kendall" = "kendall"),
                    selected = "pearson"),
        selectInput("corr_order", 
                    label = "Ordering Method:", 
                    choices = c("Hierarchical Clustering" = "hclust",
                               "Principal Component" = "AOE",
                               "Original" = "original"),
                    selected = "hclust"),
        checkboxInput("show_values", "Show Correlation Values", value = TRUE),
        hr(class = "section-divider"),
        div(class = "info-box",
          icon("circle-nodes"), " Visualize correlations across all numeric variables"
        )
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Data'",
        h4("📋 Data Explorer"),
        downloadButton("downloadData", "Download CSV", 
                      class = "btn-primary", 
                      style = "width: 100%; margin-bottom: 15px;"),
        downloadButton("downloadFiltered", "Download Filtered", 
                      class = "btn-primary", 
                      style = "width: 100%;"),
        hr(class = "section-divider"),
        div(class = "info-box",
          icon("table"), " Browse, filter, and download the complete dataset"
        )
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Advanced'",
        h4("🔬 Advanced Analytics"),
        selectInput("adv_var", 
                    label = "Select Variable:", 
                    choices = names(df), 
                    selected = names(df)[1]),
        selectInput("adv_plot_type", 
                    label = "Plot Type:", 
                    choices = c("Box Plot" = "box",
                               "Violin Plot" = "violin",
                               "Density Plot" = "density",
                               "Q-Q Plot" = "qq"),
                    selected = "box"),
        hr(class = "section-divider"),
        div(class = "info-box",
          icon("microscope"), " Advanced statistical visualizations and tests"
        )
      ),
      
      width = 3
    ),
    
    mainPanel(
      class = "main-content",
      tabsetPanel(id = "tabs", type = "pills",
        tabPanel("Overview", 
          icon = icon("house"),
          value = "Overview",
          br(),
          fluidRow(
            column(3, uiOutput("stat_rows")),
            column(3, uiOutput("stat_cols")),
            column(3, uiOutput("stat_numeric")),
            column(3, uiOutput("stat_complete"))
          ),
          hr(class = "section-divider"),
          h4("📊 Summary Statistics"),
          div(class = "plot-container",
            verbatimTextOutput("quickSummary")
          ),
          hr(class = "section-divider"),
          fluidRow(
            column(6,
              h4("📈 Variable Distribution"),
              div(class = "plot-container",
                plotlyOutput("varTypePlot", height = "350px")
              )
            ),
            column(6,
              h4("💹 Data Completeness"),
              div(class = "plot-container",
                plotlyOutput("completenessPlot", height = "350px")
              )
            )
          )
        ),
        
        tabPanel("Data", 
          icon = icon("table"),
          value = "Data",
          br(),
          h4("📋 Interactive Data Table"),
          div(class = "plot-container",
            DTOutput("dataTable")
          )
        ),
        
        tabPanel("Univariate", 
          icon = icon("chart-column"),
          value = "Univariate",
          br(),
          h4("📊 Distribution Analysis"),
          div(class = "plot-container",
            plotlyOutput("uniPlot", height = "500px")
          ),
          hr(class = "section-divider"),
          fluidRow(
            column(6,
              h4("📈 Statistical Summary"),
              verbatimTextOutput("uniSummary")
            ),
            column(6,
              h4("📉 Additional Metrics"),
              verbatimTextOutput("uniMetrics")
            )
          )
        ),
        
        tabPanel("Bivariate", 
          icon = icon("chart-scatter"),
          value = "Bivariate",
          br(),
          h4("🔗 Relationship Visualization"),
          div(class = "plot-container",
            plotlyOutput("biPlot", height = "550px")
          ),
          hr(class = "section-divider"),
          fluidRow(
            column(4, 
              h4("📊 Correlation"),
              verbatimTextOutput("biSummary")
            ),
            column(4,
              h4("📈 Sample Info"),
              verbatimTextOutput("biStats")
            ),
            column(4,
              h4("📉 Model Stats"),
              verbatimTextOutput("biModel")
            )
          )
        ),
        
        tabPanel("Correlation", 
          icon = icon("circle-nodes"),
          value = "Correlation",
          br(),
          h4("🎯 Correlation Heat Map"),
          div(class = "plot-container",
            plotOutput("corrPlot", height = "650px")
          )
        ),
        
        tabPanel("Advanced", 
          icon = icon("microscope"),
          value = "Advanced",
          br(),
          h4("🔬 Advanced Statistical Analysis"),
          div(class = "plot-container",
            plotlyOutput("advPlot", height = "500px")
          ),
          hr(class = "section-divider"),
          fluidRow(
            column(6,
              h4("📊 Normality Tests"),
              verbatimTextOutput("normalityTests")
            ),
            column(6,
              h4("📈 Descriptive Statistics"),
              verbatimTextOutput("advStats")
            )
          )
        )
      )
    )
  )
)

# Define Server with enhanced functionality
server <- function(input, output, session) {
  
  # Premium Overview Stats Cards
  output$stat_rows <- renderUI({
    div(class = "stat-card purple",
      span(class = "stat-icon", icon("database")),
      div(class = "stat-value", format(nrow(df), big.mark = ",")),
      div(class = "stat-label", "TOTAL OBSERVATIONS")
    )
  })
  
  output$stat_cols <- renderUI({
    div(class = "stat-card pink",
      span(class = "stat-icon", icon("columns")),
      div(class = "stat-value", ncol(df)),
      div(class = "stat-label", "VARIABLES")
    )
  })
  
  output$stat_numeric <- renderUI({
    num_vars <- sum(sapply(df, is.numeric))
    div(class = "stat-card blue",
      span(class = "stat-icon", icon("hashtag")),
      div(class = "stat-value", num_vars),
      div(class = "stat-label", "NUMERIC VARIABLES")
    )
  })
  
  output$stat_complete <- renderUI({
    complete_pct <- round(sum(complete.cases(df)) / nrow(df) * 100, 1)
    div(class = "stat-card green",
      span(class = "stat-icon", icon("check-circle")),
      div(class = "stat-value", paste0(complete_pct, "%")),
      div(class = "stat-label", "COMPLETE CASES")
    )
  })
  
  output$quickSummary <- renderPrint({
    summary(df)
  })
  
  # Enhanced Variable Type Visualization
  output$varTypePlot <- renderPlotly({
    var_types <- data.frame(
      Type = c("Numeric", "Other"),
      Count = c(sum(sapply(df, is.numeric)), sum(!sapply(df, is.numeric)))
    )
    
    plot_ly(var_types, labels = ~Type, values = ~Count, type = 'pie',
            marker = list(colors = c('#667eea', '#764ba2')),
            textposition = 'inside',
            textinfo = 'label+percent+value',
            hoverinfo = 'label+value+percent',
            hole = 0.4) %>%
      layout(showlegend = TRUE,
             paper_bgcolor = 'rgba(0,0,0,0)', 
             plot_bgcolor = 'rgba(0,0,0,0)',
             font = list(size = 14))
  })
  
  # Data Completeness Visualization
  output$completenessPlot <- renderPlotly({
    missing_data <- data.frame(
      Variable = names(df),
      Missing = sapply(df, function(x) sum(is.na(x))),
      Complete = sapply(df, function(x) sum(!is.na(x)))
    )
    
    plot_ly(missing_data, x = ~Variable, y = ~Complete, type = 'bar',
            name = 'Complete', marker = list(color = '#43e97b')) %>%
      add_trace(y = ~Missing, name = 'Missing', marker = list(color = '#f5576c')) %>%
      layout(barmode = 'stack',
             xaxis = list(title = "Variables", tickangle = -45),
             yaxis = list(title = "Count"),
             paper_bgcolor = 'rgba(0,0,0,0)',
             plot_bgcolor = 'rgba(0,0,0,0)',
             font = list(size = 12))
  })
  
  # Enhanced Data Table
  output$dataTable <- renderDT({
    datatable(df, 
              options = list(
                scrollX = TRUE, 
                pageLength = 20,
                lengthMenu = c(10, 20, 50, 100),
                dom = 'Blfrtip',
                initComplete = JS(
                  "function(settings, json) {",
                  "$(this.api().table().header()).css({'background-color': '#667eea', 'color': '#fff'});",
                  "}"
                )
              ),
              filter = 'top',
              class = 'cell-border stripe hover compact',
              rownames = FALSE,
              extensions = 'Buttons') %>%
      formatStyle(columns = colnames(df), 
                  fontSize = '13px',
                  backgroundColor = styleInterval(0, c('#fff', '#f8f9fa')))
  })
  
  # Download handlers
  output$downloadData <- downloadHandler(
    filename = function() {
      paste0("student_study_habits_complete_", Sys.Date(), ".csv")
    },
    content = function(file) {
      write.csv(df, file, row.names = FALSE)
    }
  )
  
  output$downloadFiltered <- downloadHandler(
    filename = function() {
      paste0("student_study_habits_filtered_", Sys.Date(), ".csv")
    },
    content = function(file) {
      write.csv(df, file, row.names = FALSE)
    }
  )
  
  # Enhanced Univariate Analysis
  output$uniPlot <- renderPlotly({
    req(input$uni_var)
    var <- df[[input$uni_var]]
    is_binary <- all(var %in% c(0, 1, NA))

    if (is_binary) {
      counts <- table(var)
      colors <- c('#667eea', '#764ba2')
      
      plot_ly(x = names(counts), y = as.numeric(counts), type = 'bar',
              marker = list(color = colors,
                           line = list(color = 'white', width = 2))) %>%
        layout(title = list(text = paste("<b>Distribution of", input$uni_var, "</b>"),
                           font = list(size = 18)),
               xaxis = list(title = input$uni_var, titlefont = list(size = 14)),
               yaxis = list(title = "Count", titlefont = list(size = 14)),
               paper_bgcolor = 'rgba(0,0,0,0)',
               plot_bgcolor = 'rgba(250,250,250,0.5)',
               hovermode = 'closest')
    } else {
      p <- plot_ly(x = var, type = "histogram", nbinsx = input$bins,
                   marker = list(color = '#667eea', 
                                line = list(color = 'white', width = 1.5))) %>%
        layout(title = list(text = paste("<b>Distribution of", input$uni_var, "</b>"),
                           font = list(size = 18)),
               xaxis = list(title = input$uni_var, titlefont = list(size = 14)),
               yaxis = list(title = "Frequency", titlefont = list(size = 14)),
               paper_bgcolor = 'rgba(0,0,0,0)',
               plot_bgcolor = 'rgba(250,250,250,0.5)')
      
      if (input$show_density && !is_binary) {
        dens <- density(var, na.rm = TRUE)
        p <- p %>% add_trace(x = dens$x, y = dens$y * length(var) * diff(range(var))/input$bins,
                            type = 'scatter', mode = 'lines',
                            line = list(color = '#f5576c', width = 3),
                            name = 'Density', yaxis = "y")
      }
      p
    }
  })
  
  output$uniSummary <- renderPrint({
    req(input$uni_var)
    cat("=== SUMMARY STATISTICS ===\n\n")
    print(summary(df[[input$uni_var]]))
  })
  
  output$uniMetrics <- renderPrint({
    req(input$uni_var)
    var <- df[[input$uni_var]]
    cat("=== ADDITIONAL METRICS ===\n\n")
    cat("Missing values:", sum(is.na(var)), "\n")
    cat("Complete cases:", sum(!is.na(var)), "\n")
    cat("Unique values:", length(unique(var)), "\n")
    if (is.numeric(var)) {
      cat("\nStd. Deviation:", round(sd(var, na.rm = TRUE), 3), "\n")
      cat("Variance:", round(var(var, na.rm = TRUE), 3), "\n")
      cat("IQR:", round(IQR(var, na.rm = TRUE), 3), "\n")
      cat("Skewness:", round((mean(var, na.rm = TRUE) - median(var, na.rm = TRUE)) / sd(var, na.rm = TRUE), 3), "\n")
    }
  })
  
  # Enhanced Bivariate Analysis
  output$biPlot <- renderPlotly({
    req(input$bi_var_x, input$bi_var_y)
    
    x_var <- df[[input$bi_var_x]]
    y_var <- df[[input$bi_var_y]]
    is_x_binary <- all(x_var %in% c(0, 1, NA))
    is_y_binary <- all(y_var %in% c(0, 1, NA))
    
    if (is_x_binary && !is_y_binary) {
      plot_ly(df, x = ~get(input$bi_var_x), y = ~get(input$bi_var_y), 
              type = 'box', color = ~factor(get(input$bi_var_x)),
              colors = c('#667eea', '#764ba2'),
              boxpoints = "all", jitter = 0.3, pointpos = -1.8) %>%
        layout(title = list(text = paste("<b>", input$bi_var_y, "by", input$bi_var_x, "</b>"),
                           font = list(size = 18)),
               xaxis = list(title = input$bi_var_x),
               yaxis = list(title = input$bi_var_y),
               paper_bgcolor = 'rgba(0,0,0,0)',
               plot_bgcolor = 'rgba(250,250,250,0.5)')
    } else {
      p <- plot_ly(df, x = ~get(input$bi_var_x), y = ~get(input$bi_var_y), 
                   type = 'scatter', mode = 'markers',
                   marker = list(color = '#667eea', 
                                size = input$point_size, 
                                opacity = input$transparency,
                                line = list(color = 'white', width = 0.5))) %>%
        layout(title = list(text = paste("<b>", input$bi_var_y, "vs", input$bi_var_x, "</b>"),
                           font = list(size = 18)),
               xaxis = list(title = input$bi_var_x, titlefont = list(size = 14)),
               yaxis = list(title = input$bi_var_y, titlefont = list(size = 14)),
               paper_bgcolor = 'rgba(0,0,0,0)',
               plot_bgcolor = 'rgba(250,250,250,0.5)',
               hovermode = 'closest')
      
      if (input$show_trend && !is_x_binary && !is_y_binary) {
        fit <- lm(y_var ~ x_var)
        pred_df <- data.frame(x = seq(min(x_var, na.rm = TRUE), 
                                      max(x_var, na.rm = TRUE), 
                                      length.out = 100))
        pred_df$y <- predict(fit, newdata = data.frame(x_var = pred_df$x))
        
        p <- p %>% add_lines(data = pred_df, x = ~x, y = ~y,
                            line = list(color = '#f5576c', width = 3),
                            name = "Trend Line")
        
        if (input$show_confidence) {
          pred_interval <- predict(fit, newdata = data.frame(x_var = pred_df$x), 
                                  interval = "confidence", level = 0.95)
          p <- p %>% 
            add_ribbons(data = pred_df, x = ~x, 
                       ymin = pred_interval[,2], ymax = pred_interval[,3],
                       fillcolor = 'rgba(245, 87, 108, 0.2)',
                       line = list(color = 'transparent'),
                       name = "95% CI", showlegend = TRUE)
        }
      }
      p
    }
  })
  
  output$biSummary <- renderPrint({
    req(input$bi_var_x, input$bi_var_y)
    corr_val <- cor(df[[input$bi_var_x]], df[[input$bi_var_y]], 
                    use = "complete.obs", method = "pearson")
    cat("Pearson Correlation:\n")
    cat(sprintf("r = %.4f\n\n", corr_val))
    cat(sprintf("r² = %.4f\n\n", corr_val^2))
    
    if (abs(corr_val) > 0.7) {
      cat("✓ Strong correlation\n")
    } else if (abs(corr_val) > 0.4) {
      cat("⚬ Moderate correlation\n")
    } else {
      cat("○ Weak correlation\n")
    }
  })
  
  output$biStats <- renderPrint({
    req(input$bi_var_x, input$bi_var_y)
    complete_pairs <- sum(complete.cases(df[[input$bi_var_x]], df[[input$bi_var_y]]))
    cat("Complete pairs:", complete_pairs, "\n")
    cat("Missing pairs:", nrow(df) - complete_pairs, "\n")
    cat("Completeness:", sprintf("%.1f%%", complete_pairs/nrow(df)*100), "\n")
  })
  
  output$biModel <- renderPrint({
    req(input$bi_var_x, input$bi_var_y)
    x_var <- df[[input$bi_var_x]]
    y_var <- df[[input$bi_var_y]]
    
    if (!all(x_var %in% c(0, 1, NA)) && !all(y_var %in% c(0, 1, NA))) {
      fit <- lm(y_var ~ x_var)
      cat("Linear Model:\n")
      cat(sprintf("Slope: %.4f\n", coef(fit)[2]))
      cat(sprintf("Intercept: %.4f\n", coef(fit)[1]))
      cat(sprintf("R-squared: %.4f\n", summary(fit)$r.squared))
      cat(sprintf("p-value: %.4e\n", summary(fit)$coefficients[2,4]))
    } else {
      cat("Model statistics\navailable for\ncontinuous variables\n")
    }
  })
  
  # Enhanced Correlation Plot
  output$corrPlot <- renderPlot({
    nums <- unlist(lapply(df, is.numeric))
    M <- cor(df[, nums], use = "complete.obs", method = input$corr_method)
    
    col_palette <- colorRampPalette(c("#764ba2", "#FFFFFF", "#667eea"))(200)
    
    corrplot(M, method = "color", type = "upper", order = input$corr_order, 
             addCoef.col = if(input$show_values) "black" else NULL,
             tl.col = "black", tl.srt = 45, tl.cex = 1.1,
             number.cex = 0.9,
             col = col_palette,
             diag = TRUE,
             title = paste("Correlation Matrix -", 
                          tools::toTitleCase(input$corr_method), "Method"),
             mar = c(0, 0, 3, 0),
             cl.cex = 1.0,
             addgrid.col = "gray90")
  }, height = 650)
  
  # Advanced Analytics
  output$advPlot <- renderPlotly({
    req(input$adv_var)
    var <- df[[input$adv_var]]
    
    if (input$adv_plot_type == "box") {
      plot_ly(y = var, type = "box", name = input$adv_var,
              marker = list(color = '#667eea'),
              boxpoints = "all", jitter = 0.3) %>%
        layout(title = paste("Box Plot -", input$adv_var),
               yaxis = list(title = input$adv_var))
    } else if (input$adv_plot_type == "violin") {
      plot_ly(y = var, type = "violin", name = input$adv_var,
              fillcolor = '#667eea', opacity = 0.6,
              box = list(visible = TRUE),
              meanline = list(visible = TRUE)) %>%
        layout(title = paste("Violin Plot -", input$adv_var),
               yaxis = list(title = input$adv_var))
    } else if (input$adv_plot_type == "density") {
      dens <- density(var, na.rm = TRUE)
      plot_ly(x = dens$x, y = dens$y, type = 'scatter', mode = 'lines',
              fill = 'tozeroy', fillcolor = 'rgba(102, 126, 234, 0.5)',
              line = list(color = '#667eea', width = 3)) %>%
        layout(title = paste("Density Plot -", input$adv_var),
               xaxis = list(title = input$adv_var),
               yaxis = list(title = "Density"))
    } else {
      # Q-Q Plot
      qqdata <- qqnorm(var, plot.it = FALSE)
      plot_ly(x = qqdata$x, y = qqdata$y, type = 'scatter', mode = 'markers',
              marker = list(color = '#667eea', size = 6)) %>%
        add_trace(x = range(qqdata$x), y = range(qqdata$x),
                 type = 'scatter', mode = 'lines',
                 line = list(color = '#f5576c', width = 2, dash = 'dash'),
                 name = 'Theoretical') %>%
        layout(title = paste("Q-Q Plot -", input$adv_var),
               xaxis = list(title = "Theoretical Quantiles"),
               yaxis = list(title = "Sample Quantiles"),
               showlegend = FALSE)
    }
  })
  
  output$normalityTests <- renderPrint({
    req(input$adv_var)
    var <- df[[input$adv_var]]
    var_clean <- var[!is.na(var)]
    
    cat("=== NORMALITY TESTS ===\n\n")
    
    if (length(var_clean) >= 3 && length(var_clean) <= 5000) {
      sw_test <- shapiro.test(var_clean)
      cat("Shapiro-Wilk Test:\n")
      cat(sprintf("  W = %.4f\n", sw_test$statistic))
      cat(sprintf("  p-value = %.4e\n", sw_test$p.value))
      cat(sprintf("  %s\n\n", 
                 ifelse(sw_test$p.value > 0.05, 
                       "✓ Data appears normal", 
                       "✗ Data deviates from normal")))
    } else {
      cat("Sample size outside range\nfor Shapiro-Wilk test\n\n")
    }
    
    cat("Skewness:", sprintf("%.4f\n", 
                            (mean(var_clean) - median(var_clean)) / sd(var_clean)))
  })
  
  output$advStats <- renderPrint({
    req(input$adv_var)
    var <- df[[input$adv_var]]
    
    cat("=== DESCRIPTIVE STATS ===\n\n")
    cat("Mean:", sprintf("%.3f\n", mean(var, na.rm = TRUE)))
    cat("Median:", sprintf("%.3f\n", median(var, na.rm = TRUE)))
    cat("Std Dev:", sprintf("%.3f\n", sd(var, na.rm = TRUE)))
    cat("Variance:", sprintf("%.3f\n", var(var, na.rm = TRUE)))
    cat("Range:", sprintf("%.3f\n", diff(range(var, na.rm = TRUE))))
    cat("IQR:", sprintf("%.3f\n", IQR(var, na.rm = TRUE)))
    cat("\nMin:", sprintf("%.3f\n", min(var, na.rm = TRUE)))
    cat("Max:", sprintf("%.3f\n", max(var, na.rm = TRUE)))
  })
}

# Run the Premium Application 
shinyApp(ui = ui, server = server)
