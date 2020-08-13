# Create the DataTable.
dt.react <- reactive({
  # Prevent red error message from appearing while data is loading.
  if (is.null(journal.df())) return(NULL)
  
  
  DT::datatable(journal.df(),
                rownames = FALSE,
                filter = 'top',
                extensions = c('Buttons'),
                options = list(
                  dom = 'Bfrtip',
                  buttons = c('copy', 'csv', 'excel'),
                  pageLength = nrow(journal.df()),
                  scrollX = TRUE,
                  scrollY = "500px",
                  autoWidth = TRUE,
                  columnDefs = rlang::list2(list(width = '100px', targets = c(1, 6)),
                                            list(width = '200px', targets = c(2, 7)),
                                            list(width = '300px', targets = c(3, 8)),
                                            list(className = 'dt-center',
                                                 targets = 1:(ncol(journal.df()) - 1)))
                  )
                )
  
})
#---------------------------------------------------------------------------- 
# Render a table representing the selected Site and Parameter.
output$dt_journals <- DT::renderDataTable(dt.react()) # End output$param_table