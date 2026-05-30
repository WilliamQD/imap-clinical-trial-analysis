# Presentation: iMAP Clinical Trial Analysis

Project context: Yale course final project | BIS 681 | Public-safe presentation derivative

This presentation summary communicates the analysis story without publishing clinical data, participant-level records, row-level dates, or private study documents.

## Slide 1: Study Context

The project analyzed an individualized Medication Assessment and Planning intervention compared with Standard Care among older adults.

## Slide 2: Analysis Strategy

The analysis followed an intention-to-treat framing and adjusted treatment-effect models for stratification variables.

## Slide 3: Workflow

| Stage | Purpose |
|---|---|
| Cleaning and QC | Standardize trial variables and correct data inconsistencies |
| Baseline reporting | Produce Table 1 and missingness summaries |
| Survival analysis | Model time to first acute utilization |
| Count modeling | Model total utilization at 12 months |
| Sensitivity checks | Evaluate competing risk and model assumptions |

## Slide 4: Sample Snapshot

| Metric | Value |
|---|---:|
| Total analytic sample | 3,388 |
| iMAP arm | 1,702 |
| Standard Care arm | 1,686 |

## Slide 5: Time-to-Event Result

Cox proportional hazards model:

- HR = 0.929,
- 95% CI: 0.856-1.008,
- p = 0.0759.

Interpretation: directionally lower hazard of first acute utilization, not statistically significant at the conventional 0.05 threshold.

## Slide 6: Count Outcome Result

Negative binomial model:

- IRR = 0.916,
- 95% CI: 0.857-0.980,
- p = 0.011.

Interpretation: statistically significant reduction in total utilization rate at 12 months.

## Slide 7: Takeaway

The project demonstrates a complete clinical analysis workflow: data cleaning, baseline reporting, survival modeling, sensitivity analysis, count regression, diagnostics, and cautious clinical interpretation.
