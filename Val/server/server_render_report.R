rmarkdown::render(file.path("Daily_Log",
                            "server",
                            "report_template.Rmd"), 
       output_file = paste0("journal-logs_",
                            Sys.Date()), 
       params = list(journals = final.df)#isolate(input$dt_journals_rows_curretn))
)
getwd()
