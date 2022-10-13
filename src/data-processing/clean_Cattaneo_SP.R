# load & clean data
sp <- read_sav(here("data/raw-private/WEIGHTED/Data wave 1 + wave 2.sav")) %>% 
  zap_labels() %>% 
  filter(DCOUNTRY == 3) %>% 
  select(id = RESPID,
         country = DCOUNTRY,
         wave = WAVE,
         weight = RIMWEIGHT,
         #DVs
         picom1 = Q80_1, #many very important things happen in the world, which the public is never in-formed about.
         picom2 = Q80_2, #politicians usually do not tell us the true motives for their decisions.
         picom3 = Q80_3, #government agencies closely monitor all citizens.
         picom4 = Q80_4, #events which superficially seem to lack a connection are often the result of secret activities
         picom5 = Q80_5, #there are secret organizations that greatly influence political decisions
         conspiracycovid1a = Q57XA_1, #The virus is a biological weapon intentionally released by China
         conspiracycovid2a = Q57XA_2, #5G technology is causing the coronavirus to spread faster
         conspiracycovid3a = Q57XA_3, #The virus has been spread by multinational pharmaceutical companies now ready to make huge profits by selling the vaccine.
         conspiracycovid4a = Q57XA_4, #The Coronavirus is a hoax
         conspiracycovid1b = Q57XB_1, #The virus is a biological weapon intentionally released by China
         conspiracycovid2b = Q57XB_2, #5G technology is causing the coronavirus to spread faster
         conspiracycovid3b = Q57XB_3, #The virus has been spread by multinational pharmaceutical companies now ready to make huge profits by selling the vaccine.
         conspiracycovid4b = Q57XB_4, #The Coronavirus is a hoax
         conspiracycovid1 = Q57_1,
         conspiracycovid2 = Q57_2,
         conspiracycovid3 = Q57_3,
         conspiracycovid4 = Q57_4,
         #IVs
         pvt_party1 = Q66AXSP_1, #PSOE
         pvt_party2 = Q66AXSP_2, #PP  
         pvt_party3 = Q66AXSP_3, #Cs 
         pvt_party4 = Q66AXSP_4, #UP 
         pvt_party5 = Q66AXSP_5, #Vox
         pvt_party6 = Q66AXSP_6, #ERC   
         pvt_party7 = Q66AXSP_7, #Junts  
         pvt_party8 = Q66AXSP_8, #PNV  
         pvt_party9 = Q66AXSP_9, #MasPais  
         pvt_party10 = Q66AXSP_10, #Bildu  
         pvt_party11 = Q66AXSP_11, #CUP 
         pvt_party12 = Q66AXSP_12, #Navarra Suma 
         pvt_party13 = Q66AXSP_13, #CC
         pvt_party14 = Q66AXSP_14, #BNG
         pid = Q55XSP,
         pid_strength = Q56,
         vote_recall = Q72AXSP,
         vote_intention = Q73XSP,
         ideology_selfplacement = Q65, #0 = left, 10 = right
         political_label = Q71,
         ideology_placement_party1 = Q66XSP_1, #PSOE: 0 = left, 10 = right, 
         ideology_placement_party2 = Q66XSP_2, #PP: 0 = left, 10 = right
         ideology_placement_party3 = Q66XSP_3, #Cs: 0 = left, 10 = right
         ideology_placement_party4 = Q66XSP_4, #UP: 0 = left, 10 = right
         ideology_placement_party5 = Q66XSP_5, #Vox: 0 = left, 10 = right
         #controls
         gender = Q1,
         age = Q2_1,
         municipality = Q3X1,
         education = Q4,
         job = Q5, #Q6-Q9 more specifics about job, Q10 = working from home
         living_situation = Q12B,
         religion = Q11,
         income = Q12,
         trust_others = Q13_1,
         trust_parliament = Q14_1,
         trust_localgov = Q14_2,
         trust_police = Q14_3,
         trust_healthcare = Q14_4,
         trust_judicial = Q14_5,
         trust_eu = Q14_6,
         covid_self = Q21_1,
         covid_friends = Q21_2,
         covid_aquintances = Q21_3,
         covid_none = Q21_100,
         tradeof_covid = Q21F_1,
         covid_concern = Q23,
         gov_perf_covid = Q24_1,
         localgov_perf_covid = Q25_1,
         eu_perf_covid = Q25A_1,
         healthcare_perf_covid = Q26_1,
         economic_eval = Q27,
         economic_prospect = Q28,
         gov_perf_econ = Q29_1,
         eu_perf_econ = Q30_1,
         eu_perf_econ_future = Q30A_1,
         tradeof_freedom_econ = Q31_1,
         tradeof_health_econ = Q32_1,
         tradeof_health_econ_party1 = Q33XSP_1, #PSOE
         tradeof_health_econ_party2 = Q33XSP_2, #PP
         tradeof_health_econ_party3 = Q33XSP_3, #Cs
         tradeof_health_econ_party4 = Q33XSP_4, #UP 
         tradeof_health_econ_party5 = Q33XSP_5, #Vox  
         tradeof_health_jobs = Q38,
         tradeof_health_freedom = Q39,
         beneficiaries_covid_measures = Q40_1, #0 = money spent on the poorest, 10 = money spent on the richest
         covid_measures_constitutional = Q41_1, 
         covid_solidarity_division = Q41B_1,
         role_state_economy = Q41C,
         impact_climate = Q41D_1,
         friend_enemy_USA = Q42_7,
         friend_enemy_CHINA = Q42_8,
         friend_enemy_RUSSIA = Q42_9,
         belief_science = Q53_1,
         influence_science = Q53_2,
         econ_immigration = Q62_1,
         cult_immigration = Q63_1,
         gender_workforce = Q64, #Men should have more right to work than women when jobs are scarce
         pol_efficacy1 = Q79_1, #Politicians should always listen closely to the problems of the people"
         pol_efficacy2 = Q79_2, #REVERSE CODING NEEDED:Politicians don’t have to spend time among ordinary people to do a good job"
         pol_efficacy3 = Q79_3, #The government is pretty much run by a few big interests looking out for themselves.
         pol_efficacy4 = Q79_4, #REVERSE CODING NEEDED: Government officials use their power to try to improve people's lives
         pol_efficacy5 = Q79_5, #REVERSE CODING NEEDED:Quite a few of the people running the government are crooked
         affective_pol1 = Q79_6, #You can tell if a person is good or bad if you know their politics
         affective_pol2 = Q79_7, #REVERSE CODING NEEDED:The people I disagree with politically are not evil
  ) %>% 
  rowwise() %>% 
  mutate(country = "SP",
         #DVs:
         type_conspiricy_question = ifelse(wave==2, "True/False",
                                           ifelse(wave==1 & is.na(conspiracycovid1b), "True/False", 
                                                  "Agree/Disagree")),
         conspiracycovid1 = sum(conspiracycovid1a, conspiracycovid1b, conspiracycovid1, na.rm=T),
         conspiracycovid1 = case_when(conspiracycovid1 == 2 ~ 0, 
                                      conspiracycovid1 == 1 ~ 1,
                                      TRUE ~ NA_real_),
         conspiracycovid2 = sum(conspiracycovid2a, conspiracycovid2b, conspiracycovid2, na.rm=T),
         conspiracycovid2 = case_when(conspiracycovid2 == 2 ~ 0, 
                                      conspiracycovid2 == 1 ~ 1,
                                      TRUE ~ NA_real_), 
         conspiracycovid3 = sum(conspiracycovid3a, conspiracycovid3b, conspiracycovid3, na.rm=T),
         conspiracycovid3 = case_when(conspiracycovid3 == 2 ~ 0, 
                                      conspiracycovid3 == 1 ~ 1,
                                      TRUE ~ NA_real_),
         conspiracycovid4 = sum(conspiracycovid4a, conspiracycovid4b, conspiracycovid4, na.rm=T),
         conspiracycovid4 = case_when(conspiracycovid4 == 2 ~ 0, 
                                      conspiracycovid4 == 1 ~ 1,
                                      TRUE ~ NA_real_),
         picom1 = case_when(picom1 == 99 ~ NA_real_, 
                            TRUE ~ picom1),
         picom2 = case_when(picom2 == 99 ~ NA_real_, 
                            TRUE ~ picom2),
         picom3 = case_when(picom3 == 99 ~ NA_real_, 
                            TRUE ~ picom3),
         picom4 = case_when(picom4 == 99 ~ NA_real_, 
                            TRUE ~ picom4),
         pid = recode(pid, #missing: 9%
                      `1` = "PSOE",
                      `2` = "PP",
                      `3` = "Ciudadanos-Partido de la Ciudadanía (Cs)",
                      `4` = "Unidas Podemos Cambiar Europa (Podemos-IU)",
                      `5` = "Vox",
                      `6` = "Esquerra Republicana de Catalunya-Sobiranistes",
                      `7` = "Junts per Catalunya",
                      `8` = "Euzko Alderdi Jeltzalea",
                      `9` = "Más País",
                      `10` = "Euskal Herria Bildu",
                      `11` = "Candidatura d'Unitat Popular",
                      `12` = "Navarra Suma",
                      `13` = "Coalición Canaria",
                      `14` = "Bloque Nacionalista Galego",
                      `90` = "Other",
                      `100` = "No party",
                      .default = "NA"),
         pid_strength = recode(pid_strength, #missing: 3%
                               `1` = "Very close",
                               `2` = "Fairly close",
                               `3` = "Merely a sympathizer",
                               .missing = "Not close to a party"),
         ideology_placement_party1 = ifelse(ideology_placement_party1 >10, NA, ideology_placement_party1), #0 = left, 10 = right, missing: 21%
         ideology_placement_party2 = ifelse(ideology_placement_party2 >10, NA, ideology_placement_party2), #0 = left, 10 = right, missing: 23%
         ideology_placement_party3 = ifelse(ideology_placement_party3 >10, NA, ideology_placement_party3), #0 = left, 10 = right, missing: 22%
         ideology_placement_party4 = ifelse(ideology_placement_party4 >10, NA, ideology_placement_party4), #0 = left, 10 = right, missing: 20%
         ideology_placement_party5 = ifelse(ideology_placement_party5 >10, NA, ideology_placement_party5), #0 = left, 10 = right, missing: 20%
         #ideology_placement_party6 = ifelse(ideology_placement_party6 >10, NA, ideology_placement_party6), #0 = left, 10 = right, missing: 24%
         political_label = recode(political_label,
                                  `1` = "Radical Left",
                                  `2` = "Left",
                                  `3`= "Center-Left",
                                  `4` = "Center",
                                  `5` = "Center-Right",
                                  `6` = "Right",
                                  `7` = "Radical Right",
                                  `100` = "None"),
         political_label = factor(political_label,
                                  levels = c("None", "Radical Left", "Left", "Center-Left", "Center",
                                             "Center-Right", "Right", "Radical-Right")),
         vote_recall = recode(vote_recall, #missing: 8%
                              `1` = "PSOE",
                              `2` = "PP",
                              `3` = "Cs",
                              `4` = "Podemos-IU",
                              `5` = "Vox",
                              `6` = "ERC-S",
                              `7` = "JxCat",
                              `8` = "EAJ",
                              `90` = "Other",
                              `94` = "Blanco",
                              `95` = "Would not vote",
                              `99` = "NA",
                              .missing = "Only asked in Wave 2"),
         vote_intention = recode(vote_intention, #missing: 14%
                                 `1` = "PSOE",
                                 `2` = "PP",
                                 `3` = "Ciudadanos-Partido de la Ciudadanía (Cs)",
                                 `4` = "Unidas Podemos Cambiar Europa (Podemos-IU)",
                                 `5` = "Vox",
                                 `6` = "Esquerra Republicana de Catalunya-Sobiranistes",
                                 `7` = "Junts per Catalunya",
                                 `8` = "Euzko Alderdi Jeltzalea",
                                 `9` = "Más País",
                                 `10` = "Euskal Herria Bildu",
                                 `11` = "Candidatura d'Unitat Popular",
                                 `12` = "Navarra Suma",
                                 `13` = "Coalición Canaria",
                                 `14` = "Bloque Nacionalista Galego",
                                 `90` = "Other",
                                 `94` = "Blanco",
                                 `95` = "Would not vote",
                                 .default = "NA"),
         #controls
         gender = recode(gender,
                         `1` = "Male",
                         `2` = "Female",
                         `3` = "Female", #added after check (<1%)
                         .default = "Female",
                         .missing = "Female"),
         education = recode(education,
                            `0` = "Less than primary",
                            `1` = "Primary education",
                            `2` = "Incomplete Secondary Education",
                            `3` = "Secondary Education",
                            `4` = "Some University or Vocational Certification",
                            `5` = "Vocational or Professional Certification Completed",
                            `6` = "University Education Completed",
                            `7` = "Postgraduate Education Completed",
                            `8` = "Doctorate, Post-doctorate or equivalent Completed",
                            `98` = "Secondary Education", #added after check (2%)
                            .default = "Secondary Education",
                            .missing = "Secondary Education"),
         job = recode(job,
                      `1` = "In paid work",
                      `2` = "In education AND working",
                      `3` = "In education and NOT working",
                      `4` = "Unemployed and actively looking for a job",
                      `5` = "Unemployed, but not actively looking for a job",
                      `6` = "doinig housework",
                      `7` = "Permanently sick or disabled",
                      `8` = "Retired",
                      `97` = "Other",
                      `98` = "In paid work", #added after check (4% missing)
                      `99` = "In paid work", #added after check (4% missing)
                      .default = "In paid work",
                      .missing = "In paid work"),
         living_situation = recode(living_situation,
                                   `1` = "Own home outright",
                                   `2` = "Own home on mortgage",
                                   `3` = "Rented from local authority",
                                   `4` = "Rented from private landlord/owner",
                                   `5` = "Rented from a Housing Association",
                                   `101` = "Other",
                                   .missing = "NA"),
         religion = 8 - religion, #1 = never, 7 = every day (missing: 8%)
         income = recode(income,
                         `1` = "Living comfortably on present income",
                         `2` = "Coping on present income",
                         `3` = "Finding it difficult on present income",
                         `4` = "Finding it very difficult on present income",
                         .default = "Coping on present income",
                         .missing = "Coping on present income"),  #added after check (9% missing)
         trust_others = ifelse(trust_others >10, NA, trust_others), #(missing: 5%)
         trust_parliament = ifelse(trust_parliament >10, NA, trust_parliament), #(missing: 6%)
         trust_localgov = ifelse(trust_localgov >10, NA, trust_localgov), #(missing: 8%)
         trust_police = ifelse(trust_police >10, NA, trust_police), #(missing: 5%)
         trust_healthcare = ifelse(trust_healthcare >10, NA, trust_healthcare), #(missing: 5%)
         trust_judicial = ifelse(trust_judicial >10, NA, trust_judicial), #(missing: 7%)
         trust_eu = ifelse(trust_eu >10, NA, trust_eu), #(missing: 8%)
         covid_self = recode(covid_self,
                              `0` = "I did not contract COVID-19",
                              `1` = "I contracted COVID-19"),
         covid_friends = recode(covid_friends,
                                 `0` = "Friends did not contract COVID-19",
                                 `1` = "Friends contracted COVID-19"),
         covid_aquintances = recode(covid_aquintances,
                                     `0` = "Aquintances did not contract COVID-19",
                                     `1` = "Aquintances contracted COVID-19"),
         covid_none = recode(covid_none,
                              `0` = "Somebody in my environment or I contracted COVID-19",
                              `1` = "Nobody in my environment contracted COVID-19"),
         tradeof_covid = ifelse(wave == 2, recode(tradeof_covid,
                                                  `1` = "Vaccines are safe",
                                                  `2` = "The benefits of Covid-19 vaccination are greater than the dangers",
                                                  `3` = "The dangers of Covid-19 vaccination are greater than the benefits",
                                                  `4` = "Vaccines are dangerous",
                                                  .default =  "NA"), #missing (12%)
                                "Only asked in Wave2"),
         covid_concern = ifelse(covid_concern <5, 5 - covid_concern, NA), #1= not at all concerned, 4 = very concerned (missing: 3%)
         gov_perf_covid = ifelse(gov_perf_covid >10, NA, gov_perf_covid), #missing: 5%
         localgov_perf_covid = ifelse(localgov_perf_covid >10, NA, localgov_perf_covid), #missing: 6%
         healthcare_perf_covid = ifelse(healthcare_perf_covid >10, NA, healthcare_perf_covid), #missing: 7%
         economic_eval= ifelse(economic_eval <6, 6 - economic_eval, NA), #1 = got a lot worse, 5 = got a lot better, missing: 4%
         economic_prospect= ifelse(economic_prospect <6, 6 - economic_prospect, NA), #1 = get a lot worse, 5 = get a lot better, missing: 4%
         gov_perf_econ = ifelse(gov_perf_econ >10, NA, gov_perf_econ), #missing: 8%
         eu_perf_econ = ifelse(eu_perf_econ >10, NA, eu_perf_econ), #misssing: 12%
         tradeof_freedom_econ = ifelse(tradeof_freedom_econ >10, NA, tradeof_health_econ),
         tradeof_health_econ = ifelse(tradeof_health_econ >10, NA, tradeof_health_econ), #0 = full restrictions to preserve health, 10 = full open economy, missing: 9%
         tradeof_health_econ_party1 = ifelse(tradeof_health_econ_party1 >10, NA, tradeof_health_econ_party1), #0 = full restrictions to preserve health, 10 = full open economy, missing: 20%
         tradeof_health_econ_party2 = ifelse(tradeof_health_econ_party2 >10, NA, tradeof_health_econ_party2), #0 = full restrictions to preserve health, 10 = full open economy, missing: 26%
         tradeof_health_econ_party3 = ifelse(tradeof_health_econ_party3 >10, NA, tradeof_health_econ_party3), #0 = full restrictions to preserve health, 10 = full open economy, missing: 22%
         tradeof_health_econ_party4 = ifelse(tradeof_health_econ_party4 >10, NA, tradeof_health_econ_party4), #0 = full restrictions to preserve health, 10 = full open economy, missing: 32%
         tradeof_health_econ_party5 = ifelse(tradeof_health_econ_party5 >10, NA, tradeof_health_econ_party5), #0 = full restrictions to preserve health, 10 = full open economy, missing: 29%
         #tradeof_health_econ_party6 = ifelse(tradeof_health_econ_party6 >10, NA, tradeof_health_econ_party6), #0 = full restrictions to preserve health, 10 = full open economy, missing: 26%
         tradeof_health_jobs = ifelse(wave == 1,
                                      recode(tradeof_health_jobs, #missing: 14%
                                             `1` = "Government protected health over jobs",
                                             `2` = "Right balance",
                                             `3` = "Government protected jobs over health",
                                             .default = "NA"),
                                      "Only asked in Wave 1"),
         tradeof_health_freedom = ifelse(wave == 1,
                                         recode(tradeof_health_freedom, #missing: 14%
                                                `1` = "Government protected health over freedoms",
                                                `2` = "Right balance",
                                                `3` = "Government protected freedoms over health",
                                                .default = "NA"),
                                         "Only asked in Wave 1"),
         beneficiaries_covid_measures = ifelse(beneficiaries_covid_measures >10, NA, beneficiaries_covid_measures), #missing:15%
         covid_measures_constitutional = ifelse(covid_measures_constitutional >10, NA, covid_measures_constitutional), #missing: 14%
         covid_solidarity_division = ifelse(covid_solidarity_division >10, NA, covid_solidarity_division), #0 = strengthened solidarity, 10 = created divisions, missing: 10%
         role_state_economy = ifelse(role_state_economy <5, 5 - role_state_economy, NA), #1 = not at all bigger role, 5 = much bigger role, missing 21%
         impact_climate = ifelse(impact_climate >10, NA, impact_climate), #0 = very limited impact, 10 = dramatic impact, missing: 9%
         friend_enemy_USA = ifelse(friend_enemy_USA <6, 6 - friend_enemy_USA, NA), #1 = much more enemy, 4 = much more friend, missing: 17%
         friend_enemy_CHINA = ifelse(friend_enemy_CHINA <6, 6 - friend_enemy_CHINA, NA), #1 = much more enemy, 4 = much more friend, missing: 18%
         friend_enemy_RUSSIA = ifelse(friend_enemy_RUSSIA <6, 6 - friend_enemy_RUSSIA, NA), #1 = much more enemy, 4 = much more friend, missing: 18%
         belief_science = ifelse(belief_science <6, 6 - belief_science, NA), #1 = very low belief in science, 5 = very high belief in science, , missing: 8%
         influence_science = ifelse(influence_science <6, 6 - influence_science, NA), #1 = very low concern about influence of science in society, 5 = very high concern about influence of science in society, , missing: 6%
         econ_immigration = ifelse(econ_immigration >10, NA, econ_immigration), #0 = bad for national’s economy that people come to live here from other countries, 10 = good for national’s economy that people come to live here from other countries, missing: 10%
         cult_immigration = ifelse(cult_immigration >10, NA, cult_immigration), #0 = national's cultural life is generally undermined by people come to live here from other countries, 10 = national's cultural life is generally enriched by people come to live here from other countries, missing: 5%
         gender_workforce = ifelse(gender_workforce <6, 6 - gender_workforce, NA), #1 = disagree strongly with statement 5 = agree strongly with statement
         pol_efficacy2 = 6 - pol_efficacy2,
         pol_efficacy4 = 6 - pol_efficacy4,
         affective_pol2 = 6 - affective_pol2)

#de$pol_efficacy2 %>% attr(which = "label")
#de %>% extract_vallab("pol_efficacy2")
#d %>% .[,181:185] %>% varl_tb()
