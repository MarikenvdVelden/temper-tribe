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
tmp <- df %>% 
  filter(wave==2) %>% 
  select(pop1:pop7)
fit <- princomp(tmp, cor=TRUE)
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

#populism check alpha
#tmp <- df %>% 
#  filter(wave == 2) %>% 
#  select(pop1:pop7) 
#fit <- princomp(tmp, cor=TRUE)
#summary(fit)
#loadings(fit)

for(i in 1:length(tot)){
  if(i==1){
    tmp <- df %>% 
      filter(wave==2, country == tot[i]) %>% 
      select(pop1, pop3:pop5) %>%
      drop_na() %>% 
      ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                          na.rm = FALSE, standardized = T)
    pop <- tibble(Country = tot2[i],
                    Wave = 2,
                    Variable = "Populist Attitudes",
                    `Cronbach's Alpha` = tmp[[1]],
                  `CI Lower` = tmp[[6]][1],
                  `CI Upper` = tmp[[6]][2])
  }
  else{
    tmp <- df %>% 
      filter(wave==2, country == tot[i]) %>% 
      select(pop1, pop3, pop5) %>%
      drop_na() %>% 
      ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                          na.rm = FALSE, standardized = T)
    pop <- pop %>% 
      add_case(tibble(Country = tot2[i],
                      Wave = 2,
                      Variable = "Populist Attitudes",
                      `Cronbach's Alpha` = tmp[[1]],
                      `CI Lower` = tmp[[6]][1],
                      `CI Upper` = tmp[[6]][2]))
  }
}

## Trust
for(i in 1:length(tot)){
  for(j in 1:length(waves)){
    if(i==1 & j==1){
      tmp <- df %>% 
        filter(wave==waves[j], country == tot[i]) %>% 
        select(matches("trust_")) %>%
        drop_na() %>% 
        ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                            na.rm = FALSE, standardized = T)
      trust <- tibble(Country = tot2[i],
                      Wave = 2,
                      Variable = "Trust",
                      `Cronbach's Alpha` = tmp[[1]],
                      `CI Lower` = tmp[[6]][1],
                      `CI Upper` = tmp[[6]][2]
      )
    }
    else{
      tmp <- df %>% 
        filter(wave==waves[j], country == tot[i]) %>% 
        select(matches("trust_")) %>%
        drop_na() %>% 
        ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, CI = TRUE,
                            na.rm = FALSE, standardized = T)
      trust <- trust %>% 
        add_case(tibble(Country = tot2[i],
                        Wave = j,
                        Variable = "Trust",
                        `Cronbach's Alpha` = tmp[[1]],
                        `CI Lower` = tmp[[6]][1],
                        `CI Upper` = tmp[[6]][2])) 
  }
  }
}

alpha <- picom %>% 
  add_case(conspiracycovid) %>% 
  add_case(pop) %>% 
  add_case(trust) %>% 
  mutate(Wave = recode(Wave,
                       `1` = "Wave 1",
                       `2` = "Wave 2")) %>% 
  ggplot(aes(x = `Cronbach's Alpha`, y = Country,
             xmin = `CI Lower`, xmax = `CI Upper`,
             color = Variable, shape = Wave)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(position = position_dodge(.5),
                width = 0) +
  labs(x = "Chronbach's Alpha", y = "",
       caption = "CI's calculated with a 1000 bootstrap samples") +
  scale_color_manual(values = c(fig_cols)) +
  theme_ipsum() +
  geom_vline(xintercept = 0.8, linetype = "dotted") +
  theme(plot.title = element_text(hjust = 0.5),
                       legend.position="bottom",
                       legend.title = element_blank()) 
rm(picom, conspiracycovid, pop, tot, tot2, waves)

df <- df %>% 
  add_index(populism_index, pop1, pop3, pop5,
            type = "mean")  %>% 
  add_index(picom_index, picom1, picom2, picom3, picom4, picom5,
            type = "mean") %>% 
  add_index(covidconsp_index, conspiracycovid1, conspiracycovid2, conspiracycovid3, conspiracycovid4,
            type = "sum") %>% 
  add_index(trust_index, matches("trust_"),
            type = "mean") 

##CONSPIRACY COVID: MOKKEN
#tst <- df %>% select(conspiracycovid1, conspiracycovid2, 
#                     conspiracycovid3, conspiracycovid4)
#mokken::check.reliability(tst)
#mokken::coefH(tst, group.var = df$country)
