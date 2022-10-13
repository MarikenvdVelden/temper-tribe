Prepare Data Pilot Studies
================

-   <a href="#required-packages--reproducibility"
    id="toc-required-packages--reproducibility">Required Packages &amp;
    Reproducibility</a>
-   <a href="#tidy-data" id="toc-tidy-data">Tidy Data</a>
-   <a href="#save-data-for-analysis" id="toc-save-data-for-analysis">Save
    Data for Analysis</a>
-   <a href="#visualization-of-data"
    id="toc-visualization-of-data">Visualization of Data</a>
    -   <a href="#dependent-variable" id="toc-dependent-variable">Dependent
        Variable</a>
    -   <a href="#independent-variables"
        id="toc-independent-variables">Independent Variables</a>

## Required Packages & Reproducibility

``` r
rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
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

We recoded the missing values of the conspiracy belief variables, age,
gender, and ideology to the mean value of the respective variables. For
the conspiracy belief variables as well as for the ideology variable, we
additionally add a dummy variable indicating whether this variable was
missing.

``` r
source(here("src/data-processing/combine_Cattaneo.R"))
save(df, file = here("data/intermediate/cleaned_catteneo.RData"))
```

``` r
alpha
```

<img src="../../report/figures/scaling variables-1.png" style="display: block; margin: auto;" />

## Save Data for Analysis

``` r
save(w1, file = here("data/intermediate/cleaned_catteneo_w1.RData"))
save(w2, file = here("data/intermediate/cleaned_catteneo_w2.RData"))
```

## Visualization of Data

### Dependent Variable

<img src="../../report/figures/Dependent Variable Obs-1.png" style="display: block; margin: auto;" />

### Independent Variables

<img src="../../report/figures/Independent Variables H1-1.png" style="display: block; margin: auto;" />

<img src="../../report/figures/Independent Variables H2-1.png" style="display: block; margin: auto;" />
