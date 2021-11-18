suppressWarnings(library(shiny))
shinyUI(fluidPage("Data Science Capstone",
                  tabPanel("Text Prediction",
                           HTML("<strong>Author: Arturk Mammadli</strong>"),
                           br(),
                           HTML("<strong>Date: January 30, 2021</strong>"),
                           br(),
                           # Sidebar
                           sidebarLayout(
                               sidebarPanel(
                                   helpText("Enter your phrase, next word will be predicted"),
                                   textInput("inputString", "Enter: ",value = ""),
                                   br(),
                                   br(),
                                   br(),
                                   br()
                               ),
                               mainPanel(
                                   h2("Prediction"),
                                   textOutput("prediction")
                                   
                               )
                           )
                           
                  )
)
)