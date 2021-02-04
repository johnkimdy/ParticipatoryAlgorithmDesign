mechanical_mi_home_side = list(sidebarMenu(
  menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
  menuItem("Widgets", tabName = "widgets", icon = icon("th"))
))

mechanical_mi_home_main=list(
  h1("Participatory Design Study"),
  br(),
  h2("This task is part of a research study conducted by Lingwei Cheng and Alex Chouldechova at Carnegie Mellon University and is funded by Amazon Web Services."),
  h3("Third level title"),
  h4("Fourth level title"),
  h5("Fifth level title"),
  h6("Sixth level title"),
  tagList(
    div(id = "login",
        wellPanel(textInput("userName", "Username"),
                  br(),actionButton("Login", "Log in")))
    ,tags$style(type="text/css", "#login {font-size:10px;   text-align: left;position:absolute;top: 40%;left: 50%;margin-top: -10px;margin-left: -150px;}")
  ),
  tabItems(
    tabItem(tabName = "dashboard", list(h1("1234"),h2("234"))),
    tabItem(tabName = "widgets", list(fluidRow(column(6,numericInput("inputtest", "test", value = 0),
                                                      column(6,actionButton(inputId ="test1",label ="go")))))
    )
  ))



mechanical_mi_title="Modify Input"
mechanical_mi_side=list(sidebarMenu(
  menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
  menuItem("Widgets", tabName = "widgets", icon = icon("th"))
))
mechanical_mi_main=list(
  
  tabItems(
    tabItem(tabName = "dashboard", list(h1("1234"),h2("234"))),
    tabItem(tabName = "widgets", list(fluidRow(column(6,numericInput("inputtest", "test", value = 0),
                                                      column(6,actionButton(inputId ="test1",label ="go")))))
    )
  ))