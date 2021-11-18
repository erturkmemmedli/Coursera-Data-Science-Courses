#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(cowplot)
shinyServer(function(input, output) {
    model <- reactive({
        brushed_data <- brushedPoints(iris, input$brush1,
                                      xvar = "Sepal.Length", yvar = "Sepal.Width"
                                    )
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(Sepal.Width ~ Sepal.Length, data = brushed_data)
    })
    
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    
    output$plot1 <- renderPlot({
        ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point() + 
            facet_grid(.~Species) + labs(title="Regression models") 
      })
})
