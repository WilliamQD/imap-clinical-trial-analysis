# Report: iMAP Clinical Trial Analysis

Project context: Yale course final project | BIS 681 | Public-safe report derivative

This report summarizes the clinical biostatistics project in a public-safe format. It preserves the analysis plan, aggregate findings, model interpretation, and contribution context while omitting raw clinical data, cleaned clinical data, participant identifiers, row-level dates, protocol files, and private study documents.

## Abstract

This project analyzed an individualized Medication Assessment and Planning intervention versus Standard Care among older adults. The workflow followed an intention-to-treat strategy and implemented study-plan-aligned data cleaning, baseline reporting, utilization outcome modeling, sensitivity analysis, and diagnostics.

The headline result was a non-significant reduction in hazard of first acute utilization and a statistically significant reduction in total utilization rate at 12 months.

## Analysis Plan

The analysis workflow included:

1. cleaning and quality-control logic for trial variables,
2. derivation of baseline and stratification variables,
3. Table 1 baseline reporting and missingness review,
4. Cox proportional hazards modeling for time to first utilization,
5. Fine-Gray competing-risk sensitivity analysis for death,
6. negative binomial regression for utilization counts,
7. diagnostic checks for model assumptions and overdispersion.

## Analytic Sample

| Metric | Value |
|---|---:|
| Total analytic sample | 3,388 |
| iMAP arm | 1,702 |
| Standard Care arm | 1,686 |

## Time to First Acute Utilization

| Arm | N | Events | Censored | Event rate | Median time |
|---|---:|---:|---:|---:|---:|
| Standard Care | 1,686 | 1,172 | 514 | 69.5% | 209 days |
| iMAP | 1,702 | 1,133 | 569 | 66.6% | 218 days |

The log-rank test gave chi-square = 3.11, p = 0.0779.

The Cox proportional hazards model estimated:

- HR = 0.929 for iMAP versus Standard Care,
- 95% CI: 0.856-1.008,
- p = 0.0759.

The global Schoenfeld test did not indicate a proportional hazards violation (p = 0.337).

## Competing-Risk Sensitivity

Death during follow-up was treated as a competing event in a Fine-Gray sensitivity analysis:

- SHR = 0.930,
- 95% CI: 0.857-1.009,
- p = 0.0821.

This was consistent with the primary Cox model.

## Total Utilizations at 12 Months

| Arm | N | Mean (SD) | Median | Total | Mean follow-up |
|---|---:|---:|---:|---:|---:|
| Standard Care | 1,686 | 1.17 (1.17) | 1 | 1,973 | 11.8 months |
| iMAP | 1,702 | 1.07 (1.11) | 1 | 1,825 | 11.8 months |

The negative binomial model estimated:

- IRR = 0.916 for iMAP versus Standard Care,
- 95% CI: 0.857-0.980,
- p = 0.011.

The variance-to-mean ratio was 1.167, and the likelihood-ratio test favored the negative binomial model over Poisson regression.

## Interpretation

iMAP showed a directionally lower hazard of first acute utilization, but the Cox model did not reach conventional statistical significance. For total utilization counts, iMAP was associated with a statistically significant reduction in utilization rate at 12 months.

## Contribution

William Zhang contributed to data cleaning and quality-control logic, Table 1 and missingness workflows, utilization outcome analysis, model diagnostics, sensitivity analysis, and clinical/statistical interpretation.

## Public-Safe Scope

This derivative excludes raw clinical data, cleaned clinical data, participant IDs, row-level dates, protocol/SAP PDFs, and private study documents.
