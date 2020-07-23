
dashboardPage(
    # skin = "black",
    dashboardHeader(title = "Val"), # End dashboardHeader
    dashboardSidebar(
        menuItem("Load Data", tabName = "load", icon = icon("arrow-circle-up"),
                 selected = TRUE),
        menuItem("Report", tabName = "report", icon = icon("newspaper")),
        menuItem("Download", tabName = "download", icon = icon("arrow-circle-down")),
        menuItem("About", tabName = "about", icon = icon("info-circle"))
    ), # End dashboardSidebar
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "load",
                    h1("Load Data"),
                    h2('Welcome to the data validation dashboard, Val.'),
                    h3('Please begin by uploading your data in the "Load Data" tab.'),
                    fluidRow(
                        box(title = "Select the Type of File(s) to be Uploaded",
                            selectInput("type", "Type:",
                                        c("ALS" = "als")),
                            fileInput("als_import", "Choose Zip File",
                                      accept = "zip"),
                            width = 6),

                        box(title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50),
                            width = 6
                        )
                    )
            ), # End tabItem load

            tabItem(tabName = "report",
                    h2("Report")
            ), # End tabItem report

            tabItem(tabName = "download",
                    h2("Download")
            ), # End tabItem download

            tabItem(tabName = "about",
                    h2("About")
            ) # End tabItem about
        ) # End tabItems
    ) # End dashboardBody
) # End dashboardPage
