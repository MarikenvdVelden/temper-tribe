Prepare Data Study 2
================

-   [Required Packages &
    Reproducibility](#required-packages--reproducibility)
-   [Tidy Data](#tidy-data)
-   [Save Data for Analysis](#save-data-for-analysis)
-   [Visualization of Data](#visualization-of-data)
    -   [Dependent Variable](#dependent-variable)
    -   [Independent Variables](#independent-variables)
    -   [Correlations Matrix](#correlations-matrix)

## Required Packages & Reproducibility

``` r
rm(list=ls())
source(here::here("src/lib/functions.R"))
#renv::snapshot()
```

## Tidy Data

This code chuck downloads the data from cleans the raw data. We impute
missing values based on the following criteria:

-   If 10% or less of the values on the dimension are missing, then we
    re-code the missing values to the overall mean.
-   If 11% or more of the values on the dimension are missing, then we
    re-code the missing values to a constant (for instance 0) and
    include a dummy variable indicating whether the response on the
    covariate was missing or not.

We recode the missing values of the conspiracy belief variables, age,
gender, and ideology to the mean value of the respective variables. For
the conspiracy belief variables as well as for the ideology variable, we
additionally add a dummy variable indicating whether this variable was
missing.

``` r
source(here("src/data-processing/s2.R"))
source(here("src/data-processing/missing-s2.R"))
kbl(df, booktabs =T, caption = "Missing Values in Data") %>%
  kable_styling(latex_options = c("striped", "hold_position"),
                full_width = F, fixed_thead = T, position = "center") %>%
  column_spec(1, width = "6cm") %>%
  column_spec(2, width = "4cm")  
rm(df, means)
```

``` r
source(here("src/data-processing/scales.R"))
kbl(scales, booktabs =T, caption = "Reliability Conspiracy Belief Scales") %>%
  kable_styling(latex_options = c("striped", "hold_position"),
                full_width = F, fixed_thead = T, position = "center") %>%
  column_spec(1, width = "6cm") %>%
  column_spec(2, width = "6cm")  
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
Reliability Conspiracy Belief Scales
</caption>
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Variable
</th>
<th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;">
Cronbach’s Alpha
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;width: 6cm; ">
General Conspiracy Belief
</td>
<td style="text-align:right;width: 6cm; ">
0.86
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Elite Conspiracy Belief
</td>
<td style="text-align:right;width: 6cm; ">
0.90
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Economic Elite Conspiracy Belief
</td>
<td style="text-align:right;width: 6cm; ">
0.87
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Political and Cultural Elite Conspiracy Belief
</td>
<td style="text-align:right;width: 6cm; ">
0.83
</td>
</tr>
</tbody>
</table>

``` r
rm(scales)
```

## Save Data for Analysis

``` r
save(d, file = here("data/intermediate/s2.RData"))
```

## Visualization of Data

### Dependent Variable

<img src="../../report/figures/Dependent Variable-1.png" style="display: block; margin: auto;" />

### Independent Variables

<img src="../../report/figures/Independent Variables-1.png" style="display: block; margin: auto;" />

### Correlations Matrix

<img src="../../report/figures/Correlations Matrix-1.png" style="display: block; margin: auto;" />
