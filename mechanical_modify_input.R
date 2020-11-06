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