# Prepare Unmatched and Matched Data S1 - H6
w1 <- w1 %>%
  mutate(tmp = paste(country, pop_pid,id, sep = "-")) %>% 
  distinct(tmp, .keep_all = TRUE) %>% 
  select(-tmp)

s1 <- w1 %>%  # MatchIt does not allow missing values
  add_index(trust_index, matches("trust_"),
            type = "mean") %>%
  select(covidconsp_index, #DV
         government_distanter_median:generalcovidgovernment_distanter_mean, #IdV
         country, pop_party,
         gender, age, education, #controls
         income, religion,
         job, trust_index, role_state_economy,
         cult_immigration, gender_workforce,
         impact_climate, economic_eval,
         economic_prospect, 
         weight, id) %>% #weights
  mutate(bin = ifelse(government_distanter_median>=4, 1,0)) %>% 
  na.omit()

mod_match_s1 <- matchit(bin ~ as.factor(pop_party) + 
                          gender + age + education + 
                          income + religion + 
                          job + trust_index + role_state_economy +
                          cult_immigration + gender_workforce +
                          impact_climate + economic_eval +
                          economic_prospect,
                        method = "nearest", data = s1)

mod_match_s1w <- matchit(bin ~ as.factor(pop_party) + 
                           gender + age + education + 
                           income + religion + 
                           job + trust_index + role_state_economy +
                           cult_immigration + gender_workforce +
                           impact_climate + economic_eval +
                           economic_prospect,
                         method = "nearest", data = s1,
                         s.weights = ~weight)

ds1m <- match.data(mod_match_s1)
ds1mw <- match.data(mod_match_s1w)

rm(mod_match_s1, mod_match_s1w)

s1m <- w1 %>% 
  filter(if_any(starts_with("missing_"), ~ . == 0)) %>% 
  add_index(trust_index, matches("trust_"),
            type = "mean") %>% 
  select(covidconsp_index, #DV
         government_distanter_median:generalcovidgovernment_distanter_mean, #IdV
         country, pop_party,
         gender, age, education, #controls
         income, religion,
         job, trust_index, role_state_economy,
         cult_immigration, gender_workforce,
         impact_climate, economic_eval,
         economic_prospect, 
         weight, id) %>% #weights
  mutate(bin = ifelse(government_distanter_median>=4, 1,0)) %>% 
  na.omit()
#s1w <- survey::svydesign(id = ~id, weights = ~weight, data = s1)
