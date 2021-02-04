#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# code help from : https://stackoverflow.com/questions/33814656/different-pages-in-shiny-app



# rm(list = ls())
# library(shiny)
# #library(googlesheets)
# 
# # For Mechanical Task Treatment Groups
# treatment_group <- function(){
# 
#     group = sample(1:5)
#     if (group == 1){
#         "Control"
#     }
#     else if (group == 2){
#         "Modify_Algorithm"
#     }
#     else if (group == 3){
#         "Modify_Input"
#     }
#     else if (group == 4){
#         "Modify_Outcome"
#     }
#     else if (group == 5){
#         "Use_Freely"
#     }
# }
# 
# 
# shinyServer(function(input, output,session) {
#     
#     my_group <- reactive ({
#         if(input$button == 0)
#         {  
#             return()
#         }  
#         isolate({   
#             treatment_group()
#             
#         })
#         
#     })
#     output$username <- renderPrint({my_group()})
#     
# })




library(shiny)
library(shinydashboard)
source("mechanical_control.r")
source("mechanical_modify_algorithm.R")
source("mechanical_modify_input.R")
source("mechanical_modify_outcome.R")
source("mechanical_use_freely.R")


my_username <- c("test","admin")
# my_password <- c("test","123")
# get_role=function(user){
#     
#     if(user=="test") {
#         
#         return("TEST")
#     }else{
#         
#         return("ADMIN")
#     }
# }

get_treatment = function(){
    return(sample(1:5,1))
}

get_ui = function(group){
    itog=list()
    # group = sample(1:5,1)
    
    # "Control"
    if (group == 1){
        itog$title=mechanical_control_title
        itog$main=mechanical_control_main
        itog$side=mechanical_control_side
        return(itog)
    }
    # "Modify_Algorithm"
    else if (group == 2){
        itog$title=mechanical_ma_title
        itog$main=mechanical_ma_main
        itog$side=mechanical_ma_side
        return(itog)
    }
    # "Modify_Input"
    else if (group == 3){
        itog$title=mechanical_mi_title
        itog$main=mechanical_mi_main
        itog$side=mechanical_mi_side
        return(itog)
    }
    # "Modify_Outcome"
    else if (group == 4){
        itog$title=mechanical_mo_title
        itog$main=mechanical_mo_main
        itog$side=mechanical_mo_side
        return(itog)
    }
    # "Use_Freely"
    else if (group == 5){
        itog$title=mechanical_uf_title
        itog$main=mechanical_uf_main
        itog$side=mechanical_uf_side
        return(itog)
    }
}


shinyServer(function(input, output,session) {
    
    USER <- reactiveValues(Logged = FALSE,treatment=NULL)
    
    ui1 <- function(){
        tagList(
            div(id = "login",
                wellPanel(textInput("userName", "Username"),
                          br(),actionButton("Login", "Log in")))
            ,tags$style(type="text/css", "#login {font-size:10px;   text-align: left;position:absolute;top: 40%;left: 50%;margin-top: -10px;margin-left: -150px;}")
        )}
    
    
    
    observe({ 
        if (USER$Logged == FALSE) {
            if (!is.null(input$Login)) {
                if (input$Login > 0) {
                    Username <- isolate(input$userName)
                    # Password <- isolate(input$passwd)
                    Id.username <- which(my_username == Username)
                    # Id.password <- which(my_password == Password)
                    if (length(Id.username) > 0) {
                        USER$Logged <- TRUE
                        # USER$treatement = get_treatment()
                    } 
                }
            }
        }
    })
    observe({
        if (USER$Logged == FALSE) {
            output$title <- renderText({
                "Participatory Design Study"
            })
            output$side <- renderUI({
                mechanical_mi_home_side
            })
            output$page <- renderUI({
                # box(
                #     div(class="outer",do.call(bootstrapPage,c("",ui1()))))
                mechanical_mi_home_main
            })
        }
        if (USER$Logged == TRUE)    {
            # itog = get_ui(get_treatment())
            itog = get_ui(3)
            print(itog$title)
            output$title<- renderText({
                itog$title
            })
            output$side <- renderUI({
                itog$side
            })
            output$page <- renderUI({
                itog$main
            })
        }
    })
})