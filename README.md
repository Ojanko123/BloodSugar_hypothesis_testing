 #  Blood Sugar Analysis - Normality Testing & Non-Parametric Tests (R)


A statistical analysis examining whether blood sugar levels in children differ based on parental diabetes status. The study applies normality tests to both groups before selecting the appropriate hypothesis test, demonstrating a rigorous assumption-checking workflow before drawing any conclusions.

This is a BSc-level statistics lab project completed as part of a Statistics and Insurance Science degree.

---

## Problem Statement

A medical team hypothesizes that children born to parents with diabetes inherit higher blood sugar levels. To investigate this, blood sugar measurements were recorded for two groups:

- **Group 1:** 5 children from parents with diabetes
- **Group 2:** 5 children from healthy parents

The analysis tests whether the two groups differ significantly in blood sugar levels.

---

## Tools & Libraries

| Library | Purpose |
|---|---|
| Base R | Data entry and structuring |
| `nortest` | Lilliefors (KS) normality test |
| `dplyr` | Data manipulation and summarisation |
| `psych` | Descriptive statistics |
| `BSDA` | One-sample Sign Test |

---

## Analysis

### Step 1 - Normality Testing

Before selecting a hypothesis test, normality was formally verified for both groups using three tests:

**Shapiro-Wilk Test** - most appropriate for small samples (n=5), tests whether data comes from a normal distribution.

**Kolmogorov-Smirnov Test** -compares the empirical distribution against a theoretical normal distribution fitted to the data.

**Lilliefors Test** - a modified KS test that does not require pre-specified parameters, more appropriate when mean and SD are estimated from the data.

Both groups were tested independently, confirming whether parametric or non-parametric methods should be applied.

### Step 2 - Descriptive Statistics

Summary statistics (mean, standard deviation, median, min, max) were computed for both groups using the `psych` library's `describe()` function.

### Step 3 - Hypothesis Testing

Since the sample size is very small (n=5 per group) and normality could not be reliably confirmed, **non-parametric tests** were applied:

**One-sample Sign Test** (`SIGN.test`):
- Tests whether the median blood sugar of children from healthy parents equals 1
- H₀: median = 1 vs H₁: median ≠ 1

**Wilcoxon Rank-Sum Test** (Mann-Whitney):
- Tests whether blood sugar levels differ between the two groups
- Applied in two equivalent formulations (vector input and formula input)
- H₀: no difference between groups vs H₁: significant difference exists

---

## Key Concepts Demonstrated

- Normality assumption testing before selecting a hypothesis test (Shapiro-Wilk, KS, Lilliefors)
- Non-parametric testing when normality assumptions are not met
- One-sample Sign Test for median comparison
- Two-sample Wilcoxon / Mann-Whitney test for group comparison
- Descriptive statistics with `psych::describe()`
- Correct statistical workflow: assumptions first, testing second

---

## How to Run

1. Open `BloodSugar.R` in RStudio
2. Install required packages if not already installed:
```r
install.packages(c("nortest", "dplyr", "psych", "BSDA"))
```
3. Run the script section by section

---



**Oresti Janko**
BSc Statistics and Insurance Science — University of Piraeus
Focus: Non-parametric statistics, hypothesis testing, statistical modelling
