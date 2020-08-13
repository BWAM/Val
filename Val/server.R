#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

# end_session -------------------------------------------------------------
    # Automatically stop session once browser window is closed.
    # Appears to work but when editing the ui.R errors will beging to appear in
    # to console.
    session$onSessionEnded(stopApp)


# list files ----------------------------------------------------------------
    # observeEvent(input$file, {
    #     file.list <- list.files(input$filepath) %>%
    #         .[grepl(".xls", .)]
    #     journal.df <- purrr::map_df(file.list, function(file.i) {
    #         # print(file.i)
    #         read_journal(.filename = file.i)
    #     }) %>%
    #         data.frame()
    #
    #     source("server/server_dt.R", local = TRUE)
    # })

    # list files ----------------------------------------------------------------


    # source("server/server_dt.R", local = TRUE)
    #
    # observeEvent(input$do, {
    #     if (is.null(input$dt_journals_rows_current)) return(NULL)
    #     rmarkdown::render(file.path("server",
    #                                 "report_template.Rmd"),
    #                       output_file = paste0("journal-logs_",
    #                                            Sys.Date()),
    #                       params = list(journals = isolate(
    #                           journal.df()[input$dt_journals_rows_current, ]))
    #     )
    # })
    # output$text_test <- renderText(unlist(input$files))
    output$zip_info <- renderTable({
        files <- input$files$datapath
        ext <- tools::file_ext(files)

        input$files
        req(files)
        validate(need(ext == "zip", "Please upload a zip file"))

        # get_zip_content(files)
        purrr::map_df(files, get_zip_content)

    })

    output$download<- downloadHandler(
        filename = paste0("nysdec-validation_",
                          Sys.Date(), ".html"),
        content = function(file) {
            report_als(.zip_path = input$files$datapath,
                       .output_dir = file)

        }
    )

    output$test <- renderText({basename(input$files$names)})
# checks -----------------------------------------------------------
    # output$contents <- renderTable({
    #
    #     inFile <- input$files
    #
    #     if (is.null(inFile))
    #         return(NULL)
    #
    #     data.frame(inFile)
    # })
# DT ----------------------------------------------------------------------
    # source("server/server_dt.R", local = TRUE)

})
