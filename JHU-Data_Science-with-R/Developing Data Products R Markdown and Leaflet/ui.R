#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Regression Models in iris dataset"),
    sidebarLayout(
        sidebarPanel(
            helpText("This is the regression model generator.
                     Please click and choose any data points you want to make specific regression model.
                     Slope and Intercept will be shown below after clicking submit button."),
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut"),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1", brush = brushOpts(
                id = "brush1"
            ))  # THe users can choose any data points to make linear regression model
        )
    )
))
