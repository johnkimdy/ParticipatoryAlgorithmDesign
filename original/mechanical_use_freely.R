# reference ui.R format
mechanical_uf_title="Use-Freely"
mechanical_uf_side=list(sidebarMenu(
  menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
  menuItem("Widgets", tabName = "widgets", icon = icon("th"))
))
mechanical_uf_main=list(

  tabItems(
    tabItem(tabName = "dashboard", list(h1("1234"),h2("234"))),
    tabItem(tabName = "widgets", list(fluidRow(column(6,numericInput("inputtest", "test", value = 0),
                                                      column(6,actionButton(inputId ="test1",label ="go")))))
    )
  ))