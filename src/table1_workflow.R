# Baseline Table 1 workflow.
#
# This template expects a private cleaned data frame and writes no public data.

library(dplyr)
library(tableone)

build_table1 <- function(df) {
  categorical_vars <- c("Treatment", "race_strat", "sex", "site")
  continuous_vars <- c("Age", "Total_Meds", "Presc_Meds", "Health_Utilization", "Conditions")
  all_vars <- c(categorical_vars, continuous_vars)

  df[categorical_vars] <- lapply(df[categorical_vars], factor)

  CreateTableOne(
    vars = all_vars,
    strata = "Treatment",
    data = df,
    factorVars = categorical_vars,
    addOverall = TRUE
  )
}

build_missingness_table <- function(df) {
  categorical_vars <- c("Treatment", "race_strat", "sex", "site")
  continuous_vars <- c("Age", "Total_Meds", "Presc_Meds", "Health_Utilization", "Conditions")
  all_vars <- c(categorical_vars, continuous_vars)

  df <- df %>%
    mutate(incomplete_outcome = if_else(is.na(MRP_6), 1L, 0L))

  CreateTableOne(
    vars = all_vars,
    strata = "incomplete_outcome",
    data = df,
    factorVars = categorical_vars
  )
}
