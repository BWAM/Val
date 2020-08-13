#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(
    navbarPage(
        title = "Val",
        theme = shinytheme("flatly"),
        tabPanel("Table",
            fileInput(
                inputId = "files",
                label = "Select all files of intrest.",
                multiple = TRUE,
                accept = c(".zip"),
                placeholder = "No file selected"),
            # textOutput("text_test"),
            br(),
            downloadButton("download", "Render Report"),
            br(),
            br(),
            # textOutput("test"),
            br(),
            shiny::tableOutput("zip_info")

            # tableOutput("contents")
        ),
        tabPanel("App Instructions",
                 tags$iframe(src = 'intro.html', # put in /www
                             width = '60%', height = '800px',
                             frameborder = 0, scrolling = 'auto')
                 )
    ) # navbar
) #ShinyUI
