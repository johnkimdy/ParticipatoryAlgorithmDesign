#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
rm(list = ls())
library(shiny)

shinyUI(
    fluidPage(   
        #Application title
        titlePanel("Participatory Design Study"),
        
        #Sidebar with controls length of password
        sidebarLayout(
            sidebarPanel(
                textInput("user", 
                             label = h3("Enter your Username here")),
                actionButton("button", "Get Data")
            ),
            
            mainPanel(
                textOutput('username')
            )
        )  
    )
)
