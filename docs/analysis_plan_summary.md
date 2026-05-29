# Analysis Plan Summary

The project followed an intention-to-treat strategy and adjusted treatment-effect models for stratification variables.

## Data Preparation

The cleaning workflow standardized categorical variables, derived race stratification, corrected impossible medication-related problem counts, handled utilization-date inconsistencies, computed time-to-event variables, converted medication-related problem subgroup indicators, and removed duplicate merge-error rows.

## Baseline Reporting

Baseline characteristics were summarized overall and by treatment arm using a Table 1 workflow. A missingness/completeness table was also used as a diagnostic for outcome availability.

## Utilization Outcomes

Two utilization endpoints were modeled:

1. **Time to first acute health-services utilization:** Cox proportional hazards model with treatment, site, and race stratification.
2. **Total utilizations at 12 months:** negative binomial regression with treatment, stratification variables, and an offset for follow-up time.

Sensitivity and diagnostics included Schoenfeld residual checks, a Fine-Gray competing-risk sensitivity model for death, and an overdispersion check supporting negative binomial over Poisson regression.
