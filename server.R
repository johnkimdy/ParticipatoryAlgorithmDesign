#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

rm(list = ls())
library(shiny)
#library(googlesheets)

# For Mechanical Task Treatment Groups
treatment_group <- function(){

    group = sample(1:5)
    if (group == 1){
        "Control"
    }
    else if (group == 2){
        "Modify_Algorithm"
    }
    else if (group == 3){
        "Modify_Input"
    }
    else if (group == 4){
        "Modify_Outcome"
    }
    else if (group == 5){
        "Use_Freely"
    }
}


shinyServer(function(input, output,session) {
    
    my_group <- reactive ({
        if(input$button == 0)
        {  
            return()
        }  
        isolate({   
            treatment_group()
            
        })
        
    })
    output$username <- renderPrint({my_group()})
    
})