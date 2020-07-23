
shinyServer(function(input, output) {

    observeEvent(input$do, {
        if (is.null(input$dt_journals_rows_current)) return(NULL)
        rmarkdown::render(file.path("server",
                                    "report_template.Rmd"),
                          output_file = paste0("journal-logs_",
                                               Sys.Date()),
                          params = list(journals = isolate(
                              journal.df()[input$dt_journals_rows_current, ]))
        )
    })

    output$download<- downloadHandler(
        filename = paste0("journal-logs_",
                          Sys.Date(), ".docx"),
        content = function(file) {
            rmarkdown::render(file.path("server",
                                        "report_template.Rmd"),
                              output_file = file,
                              params = list(journals = isolate(
                                  journal.df()[input$dt_journals_rows_current, ]))
            )
        }
    )

})
