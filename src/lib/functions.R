library(tidyverse)
library(haven)
library(here)
library(kableExtra)
library(ggstatsplot)
library(patchwork)
library(survey)
library(broom)
#library(surveytoolbox) # install with devtools::install_github("martinctc/surveytoolbox")
library(tidycomm)
library(GGally)
library(MatchIt)
library(specr)
library(hrbrthemes)
library(Cairo)
library(extrafont)

extrafont::loadfonts()

set.seed(26111985)

fig_cols <- yarrr::piratepal(palette = "basel", 
                             trans = .2)
fig_cols <- as.character(fig_cols[1:9])

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

tmp <- function(formula, data) {
  survey::svyglm(formula,design = data)
}


