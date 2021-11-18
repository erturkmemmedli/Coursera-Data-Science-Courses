#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output) {
  
  datasetss <- reactive({
    dataset <- read.csv('2020_movies.csv')
    dataset[sample(nrow(dataset), input$sampleSize),]
  })
  output$plot <- renderPlot({
    dataset <- read.csv('2020_movies.csv')
    
    p <- ggplot(datasetss(), aes_string(x=input$x, y=input$y)) + geom_point()
    dataset <- read.csv('2020_movies.csv')
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
  }, height=700)
  
}
