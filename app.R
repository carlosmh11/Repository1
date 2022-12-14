install.packages(pacman)
library(pacman)
p_load(tidyverse, map, mapproj, shiny)
source("helpers.R")
ds = readRDS("counties.rds")

ui <- fluidPage(
  
  sidebarPanel(
    helpText("Create demographic ..."),
  ),
  sidebarLayout(
    selectInput("var",
                label = "Choose a variable to display",
                choices = c("Percent White", "Percent Black", 
                            "Percent Hispanic", "Percent Asian"),
                selected = "Percent Black"),
    
    sliderInput("rango",
                label = "Range of interest:",
                min = 0, max = 100, value = c(0, 100))
  ), mainPanel(
    plotOutput("map")
  )
)
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var,
      "Percent White" = ds$white, 
      "Percent Black" = ds$black,
      "Percent Hispanic" = ds$hispanic,
      "Percent Asian" = ds$asian)
    color <- switch(input$var,
      "Percent White" = "blue", 
      "Percent Black" = "black",
      "Percent Hispanic" = "brown",
      "Percent Asian" = "yellow")
    legend <- switch(input$var,
      "Percent White" = "% blue", 
      "Percent Black" = "% black",
      "Percent Hispanic" = "% brown",
      "Percent Asian" = "% yellow")
    percent_map(data, color, legend, input$rango[1], input$rango[2])
  })
    
}
  
shinyApp(ui, server)