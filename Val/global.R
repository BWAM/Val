library(tidyverse)
library(readxl)
library(DT)
library(validator)
# read_journal ------------------------------------------------------------

read_journal <- function(.filename) {

  # filepath.vec <- file.path(#.path,
  #   .filename)

  final.df <- read_excel(.filename,
                         sheet = "Work Journal",
                         skip = 2,
                         col_types = c("text")
  ) %>%
    # mutate_if(lubridate::is.POSIXct, lubridate::hms) %>%
    mutate_if(grepl("Date", names(.)), as.numeric) %>%
    mutate_if(grepl("Date", names(.)), as.Date, origin = "1899-12-30") %>%
    mutate(Employee = as.character(read_excel(.filename,
                                              sheet = "Work Journal",
                                              col_names = FALSE,
                                              range = "B1"))) %>%
    distinct()

  names(final.df) <- c("Date",
                       "Description",
                       "Estimated_Hours",
                       "Actual_Hours",
                       "Planned_Unplanned",
                       "Result",
                       "Comments",
                       "Time_In_1",
                       "Time_Out_1",
                       "Time_In_2",
                       "Time_Out_2",
                       "Time_In_3",
                       "Time_Out_3",
                       "Employee")


  final.df %>%
    select(Date, Employee, everything())
}


# -------------------------------------------------------------------------


