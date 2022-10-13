# Prepare Unmatched and Matched Data S1 and S2 - H1
s1 <- w1 %>%  # MatchIt does not allow missing values
  add_index(trust_index, matches("trust_"),
            type = "mean") %>% 
  select(covidconsp_index, #DV
         pop_vote_intention, pop_pid, #IdV
         country, pop_party,
         gender, age, education, #controls
         income, religion,
         job, trust_index, role_state_economy,
         cult_immigration, gender_workforce,
         impact_climate, economic_eval,
         economic_prospect, 
         weight, id) %>% #weights
  na.omit()

s2 <- w2 %>%  # MatchIt does not allow missing values
  add_index(trust_index, matches("trust_"),
            type = "mean") %>%
  select(picom_index, covidconsp_index, #DV
         pop_vote_recall, pop_pid, #IdV
         pop_ptv, pop_vote_intention,
         country, pop_party,
         gender, age, education, #controls
         income, religion,
         job, trust_index, role_state_economy,
         cult_immigration, gender_workforce,
         impact_climate, economic_eval,
         economic_prospect, 
         weight, id) %>% #weights
  na.omit()

mod_match_s1 <- matchit(pop_vote_intention ~ as.factor(pop_party) + 
                                   gender + age + education + 
                                   income + religion +
                                 job + trust_index + role_state_economy +
                                 cult_immigration + gender_workforce +
                                 impact_climate + economic_eval +
                                 economic_prospect,
                              method = "nearest", data = s1)

mod_match_s1w <- matchit(pop_vote_intention ~ as.factor(pop_party) + 
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

mod_match_s2 <- matchit(pop_vote_intention ~ as.factor(pop_party) + 
                          gender + age + education + 
                          income + religion + 
                          job + trust_index + role_state_economy +
                          cult_immigration + gender_workforce +
                          impact_climate + economic_eval +
                          economic_prospect,
                        method = "nearest", data = s2)

mod_match_s2w <- matchit(pop_vote_intention ~ as.factor(pop_party) + 
                           gender + age + education + 
                           income + religion + 
                           job + trust_index + role_state_economy +
                           cult_immigration + gender_workforce +
                           impact_climate + economic_eval +
                           economic_prospect,
                         method = "nearest", data = s2,
                         s.weights = ~weight)

ds2m <- match.data(mod_match_s2)
ds2mw <- match.data(mod_match_s2w)

rm(mod_match_s1, mod_match_s1w,
   mod_match_s2, mod_match_s2w)

s1m <- w1 %>% 
  filter(if_any(starts_with("missing_"), ~ . == 0)) %>% 
  add_index(trust_index, matches("trust_"),
            type = "mean") %>% 
  select(covidconsp_index, #DV
         pop_vote_intention, pop_pid, #IdV
         country, pop_party,
         gender, age, education, #controls
         income, religion,
         job, trust_index, role_state_economy,
         cult_immigration, gender_workforce,
         impact_climate, economic_eval,
         economic_prospect, 
         weight, id) %>% #weights
  na.omit()

s2m <- w2 %>% 
  filter(if_any(starts_with("missing_"), ~ . == 0)) %>% 
  add_index(trust_index, matches("trust_"),
            type = "mean") %>% 
  select(picom_index, covidconsp_index, #DV
         pop_vote_recall, pop_pid, #IdV
         pop_ptv, pop_vote_intention,
         country, pop_party,
         gender, age, education, #controls
         income, religion,
         job, trust_index, role_state_economy,
         cult_immigration, gender_workforce,
         impact_climate, economic_eval,
         economic_prospect, 
         weight, id) %>% #weights
  na.omit()

#s1w <- survey::svydesign(id = ~id, weights = ~weight, data = s1)
#s2w <- survey::svydesign(id = ~id, weights = ~weight, data = s2)



