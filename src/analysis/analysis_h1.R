# Conduct Multiverse S1

#matched data - not weighted S1
m1a <- run_specs(df = ds1m, 
                     y = c("covidconsp_index"), 
                     x = c("pop_vote_intention","pop_pid"), 
                     model = c("lm"), 
                     controls = c("gender", "age", "education", #controls
                                  "income", "religion",
                                  "job", "trust_index", "role_state_economy",
                                  "cult_immigration", "gender_workforce",
                                  "impact_climate", "economic_eval",
                                  "economic_prospect"),
                     subsets = list(pop_party = unique(ds1m$pop_party))) %>% 
  mutate(study = "Study 1: Covid Conspiracy Beliefs",
         sample = "PSM",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 202)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 277)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 376)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 450)",
                          `pop_party = Vox` = "Vox (Spain, N = 207)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 383)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 259)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 182)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 450)",
                                     "Vox (Spain, N = 207)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 376)",
                                     "Fratelli d'Italia (Italy, N = 182)",
                                     "Movimento 5 Stelle (Italy, N = 259)",
                                     "Lega Salvini Premier (Italy, N = 383)",
                                     "Rassemblement National (France, N = 277)",
                                     "AfD (Germany, N = 202)",
                                     "Support for ...")))

#matched data - weighted S1
m1b <- run_specs(df = ds1mw, 
                 y = c("covidconsp_index"), 
                 x = c("pop_vote_intention","pop_pid"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(ds1mw$pop_party))) %>% 
  mutate(study = "Study 1: Covid Conspiracy Beliefs",
         sample = "Weighted PSM",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 202)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 280)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 381)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 426)",
                          `pop_party = Vox` = "Vox (Spain, N = 201)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 393)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 254)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 199)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 426)",
                                     "Vox (Spain, N = 201)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 381)",
                                     "Fratelli d'Italia (Italy, N = 199)",
                                     "Movimento 5 Stelle (Italy, N = 254)",
                                     "Lega Salvini Premier (Italy, N = 393)",
                                     "Rassemblement National (France, N = 280)",
                                     "AfD (Germany, N = 202)",
                                     "Support for ...")))

#data -  not weighted S1
m1c <- run_specs(df = s1, 
                 y = c("covidconsp_index"), 
                 x = c("pop_vote_intention","pop_pid"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(s1$pop_party))) %>% 
  mutate(study = "Study 1: Covid Conspiracy Beliefs",
         sample = "Survey Data",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 1003)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 1002)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 1001)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 1005)",
                          `pop_party = Vox` = "Vox (Spain, N = 1000)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 1002)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 1002)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 1002)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 1005)",
                                     "Vox (Spain, N = 1000)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 1001)",
                                     "Fratelli d'Italia (Italy, N = 1002)",
                                     "Movimento 5 Stelle (Italy, N = 1002)",
                                     "Lega Salvini Premier (Italy, N = 1002)",
                                     "Rassemblement National (France, N = 1002)",
                                     "AfD (Germany, N = 1003)",
                                     "Support for ...")))

#data -  not weighted, mssings removed S1
m1d <- run_specs(df = s1m, 
                 y = c("covidconsp_index"), 
                 x = c("pop_vote_intention","pop_pid"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(s1$pop_party))) %>% 
  mutate(study = "Study 1: Covid Conspiracy Beliefs",
         sample = "Survey Data (No Missings >10%)",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 990)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 994)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 997)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 1000)",
                          `pop_party = Vox` = "Vox (Spain, N = 994)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 999)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 999)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 999)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 1000)",
                                     "Vox (Spain, N = 994)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 997)",
                                     "Fratelli d'Italia (Italy, N = 999)",
                                     "Movimento 5 Stelle (Italy, N = 999)",
                                     "Lega Salvini Premier (Italy, N = 999)",
                                     "Rassemblement National (France, N = 994)",
                                     "AfD (Germany, N = 990)",
                                     "Support for ...")))


#matched data - not weighted S2
m1e <- run_specs(df = ds2m, 
                 y = c("picom_index", "covidconsp_index"), 
                 x = c("pop_ptv", "pop_pid", 
                       "pop_vote_recall", "pop_vote_intention"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(ds2m$pop_party))) %>% 
  mutate(study = ifelse(y == "picom_index", 
                        "Study 2: General Conspiracy Mentality", 
                        "Study 2: Covid Conspiracy Beliefs"),
         sample = "PSM",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 202)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 277)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 376)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 450)",
                          `pop_party = Vox` = "Vox (Spain, N = 207)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 383)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 259)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 182)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 450)",
                                     "Vox (Spain, N = 207)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 376)",
                                     "Fratelli d'Italia (Italy, N = 182)",
                                     "Movimento 5 Stelle (Italy, N = 259)",
                                     "Lega Salvini Premier (Italy, N = 383)",
                                     "Rassemblement National (France, N = 277)",
                                     "AfD (Germany, N = 202)",
                                     "Support for ...")))

#matched data - weighted S2
m1f <- run_specs(df = ds2mw, 
                 y = c("picom_index", "covidconsp_index"), 
                 x = c("pop_ptv", "pop_pid", 
                       "pop_vote_recall", "pop_vote_intention"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(ds2mw$pop_party))) %>% 
  mutate(study = ifelse(y == "picom_index",  
                        "Study 2: General Conspiracy Mentality", 
                        "Study 2: Covid Conspiracy Beliefs"),
         sample = "Weighted PSM",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 202)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 280)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 381)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 426)",
                          `pop_party = Vox` = "Vox (Spain, N = 201)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 393)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 254)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 199)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 426)",
                                     "Vox (Spain, N = 201)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 381)",
                                     "Fratelli d'Italia (Italy, N = 199)",
                                     "Movimento 5 Stelle (Italy, N = 254)",
                                     "Lega Salvini Premier (Italy, N = 393)",
                                     "Rassemblement National (France, N = 280)",
                                     "AfD (Germany, N = 202)",
                                     "Support for ...")))

#data -  not weighted S2
m1g <- run_specs(df = s2, 
                 y = c("picom_index", "covidconsp_index"), 
                 x = c("pop_ptv", "pop_pid", 
                       "pop_vote_recall", "pop_vote_intention"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(s2$pop_party))) %>% 
  mutate(study = ifelse(y == "picom_index",  
                        "Study 2: General Conspiracy Mentality", 
                        "Study 2: Covid Conspiracy Beliefs"),
         sample = "Survey Data",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 1003)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 1002)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 1001)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 1005)",
                          `pop_party = Vox` = "Vox (Spain, N = 1000)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 1002)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 1002)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 1002)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 1005)",
                                     "Vox (Spain, N = 1000)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 1001)",
                                     "Fratelli d'Italia (Italy, N = 1002)",
                                     "Movimento 5 Stelle (Italy, N = 1002)",
                                     "Lega Salvini Premier (Italy, N = 1002)",
                                     "Rassemblement National (France, N = 1002)",
                                     "AfD (Germany, N = 1003)",
                                     "Support for ...")))

#data -  not weighted, mssings removed S2
m1h <- run_specs(df = s2m, 
                 y = c("picom_index", "covidconsp_index"), 
                 x = c("pop_ptv", "pop_pid", 
                       "pop_vote_recall", "pop_vote_intention"), 
                 model = c("lm"), 
                 controls = c("gender", "age", "education", #controls
                              "income", "religion",
                              "job", "trust_index", "role_state_economy",
                              "cult_immigration", "gender_workforce",
                              "impact_climate", "economic_eval",
                              "economic_prospect"),
                 subsets = list(pop_party = unique(s2$pop_party))) %>% 
  mutate(study = ifelse(y == "picom_index",  
                        "Study 2: General Conspiracy Mentality", 
                        "Study 2: Covid Conspiracy Beliefs"),
         sample = "Survey Data (No Missings >10%)",
         subsets = recode(subsets,
                          `all` = "Support for ...",
                          `pop_party = AfD` = "AfD (Germany, N = 990)",
                          `pop_party = Rassemblement national` = "Rassemblement National (France, N = 994)",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś (Poland, N = 997)",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna (Sweden, N = 1000)",
                          `pop_party = Vox` = "Vox (Spain, N = 994)",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier (Italy, N = 999)",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle (Italy, N = 999)",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia (Italy, N = 999)"),
         subsets = factor(subsets,
                          levels = c("Sverigedemokraterna (Sweden, N = 1000)",
                                     "Vox (Spain, N = 994)",
                                     "Prawo i Sprawiedliwoś (Poland, N = 997)",
                                     "Fratelli d'Italia (Italy, N = 999)",
                                     "Movimento 5 Stelle (Italy, N = 999)",
                                     "Lega Salvini Premier (Italy, N = 999)",
                                     "Rassemblement National (France, N = 994)",
                                     "AfD (Germany, N = 990)",
                                     "Support for ...")))

lt <- "dashed"
extrafont::loadfonts()

h1 <- m1a %>% 
  add_case(m1b) %>% 
  add_case(m1c) %>% 
  add_case(m1d) %>% 
  add_case(m1e) %>% 
  add_case(m1f) %>% 
  add_case(m1g) %>% 
  add_case(m1h) %>% 
  mutate(x = recode(x,
                    `pop_vote_intention` = "Populist Vote Intention",
                    `pop_pid` = "Populist Party Identity",
                    `pop_vote_recall` = "Populist Vote Last Election",
                    `pop_ptv` = "PTV for Populist Party"),
         sample = factor(sample,
                         levels = c("Survey Data",
                                    "Survey Data (No Missings >10%)",
                                    "PSM",
                                    "Weighted PSM")),
         estimate = ifelse(subsets == "Support for ...", NA, estimate),
         conf.low = ifelse(subsets == "Support for ...", NA, conf.low),
         conf.high = ifelse(subsets == "Support for ...", NA, conf.high)) %>% 
  filter(subsets != "Support for ...") %>% 
  ggplot(aes(x = estimate,
             y = subsets,
             color = x,
             xmin = conf.low,
             xmax = conf.high)) +
  geom_point(alpha = 0.2, position = position_dodge(.9),
             size = 2) +
  geom_errorbar(alpha = 0.2, position = position_dodge(.9),
                width = 0) +
  facet_grid(sample ~ study,
             scales = "free_y") +
  hrbrthemes::theme_ipsum() +
  labs(y="", x= "Estimated Predictions for Y",
       caption = "Note: PSM = Propensity Score Matching") +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position="bottom",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_vline(xintercept = 0.0, linetype = lt, 
             size = .5, color = "gray20") +
  guides(color=guide_legend(nrow=2,byrow=TRUE))

ms1 <- m1a %>% 
  add_case(m1b) %>% 
  add_case(m1c) %>% 
  add_case(m1d) %>% 
  filter(subsets != "all") %>%
  mutate(sign = ifelse(p.value <0.05, "Statistically Significant",
                       "Not Statistically Significant"),
         subsets = recode(subsets,
                          `all` = "All Populist Parties",
                          `pop_party = AfD` = "AfD \n Germany, N = 1003",
                          `pop_party = Rassemblement national` = "Rassemblement National \n France, N = 1002",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś \n Poland, N = 1002",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna \n Sweden, N = 1005",
                          `pop_party = Vox` = "Vox \n Spain, N = 1000",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier \n Italy, N = 1002",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle \n Italy, N = 1002",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia \n Italy, N = 1002")) %>% 
  group_by(subsets,sign) %>% 
  count() %>% 
  ungroup() %>% 
  select(Country = subsets,
         sign, n) %>% 
  pivot_wider(names_from = sign,
              values_from = n) %>% 
  mutate(`Not Statistically Significant` = replace_na(`Not Statistically Significant`, 0),
         Study = "Study 1: Covid Conspiracy Beliefs")

ms2a <- m1e %>% 
  add_case(m1f) %>% 
  add_case(m1g) %>% 
  add_case(m1h) %>% 
  filter(subsets != "all",
         y == "covidconsp_index") %>%
  mutate(sign = ifelse(p.value <0.05, "Statistically Significant",
                       "Not Statistically Significant"),
         subsets = recode(subsets,
                          `all` = "All Populist Parties",
                          `pop_party = AfD` = "AfD \n Germany, N = 1003",
                          `pop_party = Rassemblement national` = "Rassemblement National \n France, N = 1002",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś \n Poland, N = 1002",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna \n Sweden, N = 1005",
                          `pop_party = Vox` = "Vox \n Spain, N = 1000",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier \n Italy, N = 1002",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle \n Italy, N = 1002",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia \n Italy, N = 1002")) %>% 
  group_by(subsets,sign) %>% 
  count() %>% 
  ungroup() %>% 
  select(Country = subsets,
         sign, n) %>% 
  pivot_wider(names_from = sign,
              values_from = n) %>% 
  mutate(`Not Statistically Significant` = replace_na(`Not Statistically Significant`, 0),
         Study = "Study 2: Covid Conspiracy Beliefs")

ms2b <- m1e %>% 
  add_case(m1f) %>% 
  add_case(m1g) %>% 
  add_case(m1h) %>% 
  filter(subsets != "all",
         y == "picom_index") %>%
  mutate(sign = ifelse(p.value <0.05, "Statistically Significant",
                       "Not Statistically Significant"),
         subsets = recode(subsets,
                          `all` = "All Populist Parties",
                          `pop_party = AfD` = "AfD \n Germany, N = 1003",
                          `pop_party = Rassemblement national` = "Rassemblement National \n France, N = 1002",
                          `pop_party = Prawo i Sprawiedliwość` = "Prawo i Sprawiedliwoś \n Poland, N = 1002",
                          `pop_party = Sverigedemokraterna` = "Sverigedemokraterna \n Sweden, N = 1005",
                          `pop_party = Vox` = "Vox \n Spain, N = 1000",
                          `pop_party = Lega Salvini Premier` = "Lega Salvini Premier \n Italy, N = 1002",
                          `pop_party = Movimento 5 Stelle` = "Movimento 5 Stelle \n Italy, N = 1002",                          
                          `pop_party = Fratelli d'Italia` = "Fratelli d'Italia \n Italy, N = 1002")) %>% 
  group_by(subsets,sign) %>% 
  count() %>% 
  ungroup() %>% 
  select(Country = subsets,
         sign, n) %>% 
  pivot_wider(names_from = sign,
              values_from = n) %>% 
  mutate(`Not Statistically Significant` = replace_na(`Not Statistically Significant`, 0),
         Study = "Study 2: General Conspiracy Mentality")
