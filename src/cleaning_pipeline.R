# Parameterized iMAP data-cleaning workflow.
#
# This public script preserves the structure of the original cleaning work
# without publishing private trial data, participant IDs, or correction lists.

library(dplyr)
library(lubridate)
library(readr)

standardize_categories <- function(df) {
  df %>%
    mutate(
      race = case_when(
        race %in% c("black", "Black") ~ "Black",
        TRUE ~ race
      ),
      race_strat = if_else(race == "White", "White", "non-White"),
      sex = case_when(
        sex %in% c("F", "Female") ~ "Female",
        sex %in% c("M", "Male") ~ "Male",
        TRUE ~ sex
      )
    )
}

correct_mrp_counts <- function(df) {
  df %>%
    mutate(
      MRP_6 = if_else(!is.na(MRP_6) & MRP_6 < 0, -MRP_6, MRP_6)
    )
}

derive_time_to_event <- function(df) {
  df %>%
    mutate(
      Enroll_date = as_date(Enroll_date),
      Utilization = as_date(Utilization),
      time_to_event = as.numeric(Utilization - Enroll_date)
    )
}

set_analysis_factors <- function(df) {
  df %>%
    mutate(
      Treatment = factor(Treatment, levels = c("Standard Care", "iMAP")),
      site = factor(site),
      race_strat = factor(race_strat, levels = c("White", "non-White")),
      sex = factor(sex),
      status = as.integer(status),
      death = as.integer(death)
    )
}

clean_imap_data <- function(df) {
  df %>%
    standardize_categories() %>%
    correct_mrp_counts() %>%
    derive_time_to_event() %>%
    set_analysis_factors()
}

# Example private-use entrypoint:
# raw <- read_csv("data/private/raw_trial_data.csv", show_col_types = FALSE)
# cleaned <- clean_imap_data(raw)
# write_csv(cleaned, "data/private/analysis_ready_trial_data.csv")
