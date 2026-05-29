# Utilization outcome models for iMAP clinical analysis.

library(dplyr)
library(MASS)
library(survival)

fit_time_to_first_utilization <- function(df) {
  surv_obj <- Surv(time = df$time_to_event, event = df$status)
  coxph(surv_obj ~ Treatment + site + race_strat, data = df)
}

check_ph_assumption <- function(cox_model) {
  cox.zph(cox_model)
}

fit_competing_risk_sensitivity <- function(df) {
  df <- df %>%
    mutate(
      event_cr = case_when(
        status == 1 ~ 1L,
        status == 0 & death == 1 ~ 2L,
        TRUE ~ 0L
      )
    )

  fg_data <- finegray(
    Surv(time_to_event, factor(event_cr)) ~ .,
    data = df %>% select(time_to_event, event_cr, Treatment, site, race_strat),
    etype = "1"
  )

  coxph(
    Surv(fgstart, fgstop, fgstatus) ~ Treatment + site + race_strat,
    data = fg_data,
    weight = fgwt
  )
}

fit_total_utilizations_nb <- function(df) {
  df <- df %>%
    mutate(
      follow_up_months = case_when(
        death == 1 ~ time_to_event / 30.44,
        TRUE ~ 12
      )
    )

  glm.nb(
    status_total ~ Treatment + site + race_strat + offset(log(follow_up_months)),
    data = df
  )
}

overdispersion_ratio <- function(counts) {
  var(counts, na.rm = TRUE) / mean(counts, na.rm = TRUE)
}
