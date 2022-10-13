#load data
load(here("data/intermediate/scaling-data.RData"))

#picom check alpha
tot <- unique(df$country)
tot2 <- c("Germany", "France", "Italy", "Poland", "Spain", "Sweden")

for(i in 1:length(tot)){
  if(i==1){
    tmp <- df %>% 
      filter(wave==2, country == tot[i]) %>% 
      select(picom1:picom5) %>%
      drop_na() %>% 
      ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                          na.rm = FALSE, standardized = T)
    picom <- tibble(Country = tot2[i],
                    Wave = 2,
                    Variable = "PICOM",
                    `Cronbach's Alpha` = tmp[[1]],
                    `CI Lower` = tmp[[6]][1],
                    `CI Upper` = tmp[[6]][2]
    )
  }
  else{
    tmp <- df %>% 
      filter(wave==2, country == tot[i]) %>% 
      select(picom1:picom5) %>%
      drop_na() %>% 
      ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                          na.rm = FALSE, standardized = T)
    picom <- picom %>% 
      add_case(tibble(Country = tot2[i],
                      Wave = 2,
                      Variable = "PICOM",
                      `Cronbach's Alpha` = tmp[[1]],
                      `CI Lower` = tmp[[6]][1],
                      `CI Upper` = tmp[[6]][2]))
  }
}

#covidconspiracy check alpha
waves <- c(1,2)
for(i in 1:length(tot)){
  for(j in 1:length(waves)){
    if(i==1 & j ==1){
      tmp <- df %>% 
        filter(wave==j, country == tot[i]) %>% 
        select(conspiracycovid1:conspiracycovid4) %>%
        drop_na() %>% 
        ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                            na.rm = FALSE, standardized = T)
      conspiracycovid <- tibble(Country = tot2[i],
                                Wave = waves[j],
                                Variable = "Covid Specific Conspiracy Beliefs",
                                `Cronbach's Alpha` = tmp[[1]],
                                `CI Lower` = tmp[[6]][1],
                                `CI Upper` = tmp[[6]][2])
    }
    else{
      tmp <- df %>% 
        filter(wave==j, country == tot[i]) %>% 
        select(conspiracycovid1:conspiracycovid4) %>%
        drop_na() %>% 
        ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                            na.rm = FALSE, standardized = T)
      conspiracycovid <- conspiracycovid %>% 
        add_case(tibble(Country = tot2[i],
                        Wave = waves[j],
                        Variable = "Covid Specific Conspiracy Beliefs",
                        `Cronbach's Alpha` = tmp[[1]],
                        `CI Lower` = tmp[[6]][1],
                        `CI Upper` = tmp[[6]][2]))
    }
  }
}
