Prepare Data Study 1
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
source(here("src/data-processing/s1.R"))
source(here("src/data-processing/missing-s1.R"))

kbl(df, booktabs =T, caption = "Missing Values in Data") %>%
  kable_styling(latex_options = c("striped", "hold_position"),
                full_width = F, fixed_thead = T, position = "center") %>%
  column_spec(1, width = "6cm") %>%
  column_spec(2, width = "4cm")  
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
Missing Values in Data
</caption>
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Variables
</th>
<th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;">
% Missing Values
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;width: 6cm; ">
Conspiracy Belief (1)
</td>
<td style="text-align:right;width: 4cm; ">
0.29
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Conspiracy Belief (2)
</td>
<td style="text-align:right;width: 4cm; ">
0.29
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Conspiracy Belief (3)
</td>
<td style="text-align:right;width: 4cm; ">
0.30
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Conspiracy Belief (4)
</td>
<td style="text-align:right;width: 4cm; ">
0.30
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Conspiracy Belief (5)
</td>
<td style="text-align:right;width: 4cm; ">
0.29
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Age
</td>
<td style="text-align:right;width: 4cm; ">
0.02
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Gender
</td>
<td style="text-align:right;width: 4cm; ">
0.03
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Education
</td>
<td style="text-align:right;width: 4cm; ">
0.00
</td>
</tr>
<tr>
<td style="text-align:left;width: 6cm; ">
Ideology
</td>
<td style="text-align:right;width: 4cm; ">
0.49
</td>
</tr>
</tbody>
</table>

``` r
cb <- d %>%
  drop_na(weight) %>% 
  select(matches("cb\\d")) %>%
  ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, na.rm = FALSE)

scales <- tibble(Variable = c("Conspiracy Belief"),
                 `Cronbach's Alpha` = c(cb[[1]]))

kbl(scales, booktabs =T, caption = "Reliability Conspiracy Belief Scale") %>%
  kable_styling(latex_options = c("striped", "hold_position"),
                full_width = F, fixed_thead = T, position = "center") %>%
  column_spec(1, width = "6cm") %>%
  column_spec(2, width = "6cm")  
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
Reliability Conspiracy Belief Scale
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
Conspiracy Belief
</td>
<td style="text-align:right;width: 6cm; ">
0.77
</td>
</tr>
</tbody>
</table>

``` r
d <- d %>% 
  mutate(cb = (cb1 + cb2 + cb3 + cb4 + cb5)/5)

rm(scales,cb, df,  means)
```

## Save Data for Analysis

``` r
save(d, file = here("data/intermediate/s1.RData"))
```

## Visualization of Data

### Dependent Variable

<img src="../../report/figures/Dependent Variable Obs-1.png" style="display: block; margin: auto;" />

### Independent Variables

<img src="../../report/figures/Independent Variables Obs-1.png" style="display: block; margin: auto;" />

### Correlations Matrix

<img src="../../report/figures/Correlations Matrix-1.png" style="display: block; margin: auto;" />
