# iMAP Clinical Trial Analysis

Curated public portfolio version of a BIS 681 clinical biostatistics project analyzing medication-related outcomes and acute health-services utilization in the iMAP randomized trial.

This is a no-data showcase repository. It demonstrates the analysis design, statistical workflow, and reporting quality without publishing raw clinical data, cleaned clinical data, participant-level records, protocol files, or private study documents.

## Overview

The original project analyzed an individualized Medication Assessment and Planning intervention versus Standard Care among older adults. The workflow followed an intention-to-treat analysis strategy and implemented study-plan-aligned data cleaning, baseline table generation, outcome modeling, sensitivity analysis, and assumption checks.

The public repo focuses on the reproducible structure of the work:

- data cleaning and quality-control logic,
- Table 1 baseline reporting,
- mixed-model framing for medication-related problems,
- Cox proportional hazards modeling for time to first acute utilization,
- negative binomial modeling for utilization counts,
- clear clinical interpretation of treatment effects.

## My Contribution

I worked on the clinical data-analysis pipeline and public-facing reporting artifacts:

- cleaned and quality-checked trial variables,
- implemented SAP-aligned analysis scripts in R,
- produced baseline, missingness, and utilization summaries,
- fit survival and count models,
- wrote clinical/statistical interpretation in report format.

## Study Snapshot

Aggregate study-level figures from the final report:

| Metric | Value |
|---|---:|
| Analytic sample | 3,388 participants |
| iMAP arm | 1,702 participants |
| Standard Care arm | 1,686 participants |
| Standard Care first-utilization event rate | 69.5% |
| iMAP first-utilization event rate | 66.6% |
| Deaths treated in competing-risk sensitivity | 77 |

No row-level data is included.

## Headline Results

| Outcome | Estimate | 95% CI | p-value |
|---|---:|---:|---:|
| Time to first utilization, Cox PH | HR = 0.929 | 0.856-1.008 | 0.0759 |
| Competing-risk sensitivity, Fine-Gray | SHR = 0.930 | 0.857-1.009 | 0.0821 |
| Total utilizations at 12 months, Negative Binomial | IRR = 0.916 | 0.857-0.980 | 0.011 |

Interpretation: iMAP showed a non-significant reduction in the hazard of first acute utilization, while the negative binomial model found a statistically significant reduction in total utilization rate at 12 months.

## Repository Structure

```text
src/
  cleaning_pipeline.R       # parameterized cleaning/QC workflow
  table1_workflow.R         # baseline and missingness table workflow
  utilization_models.R      # Cox PH, competing risk, and NB model skeleton
docs/
  analysis_plan_summary.md
  results_summary.md
  privacy.md
  contribution_note.md
data/
  README.md                 # explains why no clinical data is published
```

## Validation

The original analyses were run in R with `tidyverse`, `lubridate`, `tableone`, `survival`, `MASS`, and `survminer`. R is not bundled in this local Codex environment, so executable R validation is not claimed here. The public scripts are curated templates preserving the analysis logic without private participant data.

## Data and Privacy

This repo does not include:

- raw clinical data,
- cleaned clinical data,
- participant IDs,
- row-level dates,
- issue trackers,
- protocol/SAP PDFs,
- private study documents.

See [docs/privacy.md](docs/privacy.md).

## Skills Demonstrated

- Clinical trial data cleaning
- Intention-to-treat analysis
- R statistical programming
- Baseline Table 1 workflow
- Survival analysis / Cox PH
- Competing-risk sensitivity analysis
- Negative binomial regression
- Clinical reporting and assumption checks
