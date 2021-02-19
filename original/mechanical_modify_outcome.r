# reference ui.R format
mechanical_mo_title="Modify Outcome"
mechanical_mo_side=list(sidebarMenu(
  menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))))

mechanical_mo_main=list(

  tabItems(
    tabItem(tabName = "dashboard", list(h1("user"),h2("user")))
  ))