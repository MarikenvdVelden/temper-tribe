#### Operationalization Cattaneo ####

#Government parties [wave 2: October/November 2021]
#Germany: CDU, SPD
#Spain: PSOE, UP, ECP, EM
#Italy: M5E, Italia Viva, Partido Democratico, Sinistra, Lega Nord, Forza Italia
#Poland: PiS
#Sweden: MP, SAP
#France: LREM, MoDem, RAD, Agir, TDP,

gov_parties_de <- df %>% 
  filter(country== "DE") %>% 
  rowwise() %>% 
  mutate(placement_government_median= median(ideology_placement_party1, ideology_placement_party3, na.rm = TRUE),
         placement_government_mean= mean(c(ideology_placement_party1, ideology_placement_party3), na.rm = TRUE),
         covidplacement_government_median= median(tradeof_health_econ_party1, tradeof_health_econ_party3, na.rm = TRUE),
         covidplacement_government_mean= mean(c(tradeof_health_econ_party1, tradeof_health_econ_party3), na.rm = TRUE)) %>% 
  ungroup() %>% 
  mutate(generalplacement_government_median= median(ideology_placement_party1, ideology_placement_party3, na.rm = TRUE),
         generalplacement_government_mean= mean(c(ideology_placement_party1, ideology_placement_party3), na.rm = TRUE),
         generalcovidplacement_government_median= median(tradeof_health_econ_party1, tradeof_health_econ_party3, na.rm = TRUE),
         generalcovidplacement_government_mean= mean(c(tradeof_health_econ_party1, tradeof_health_econ_party3), na.rm = TRUE)) %>% 
  select(id:weight, placement_government_median:generalcovidplacement_government_mean)


gov_parties_sp <- df %>% 
  filter(country== "SP") %>% 
  rowwise() %>% 
  mutate(placement_government_median= ideology_placement_party1,
         placement_government_mean= ideology_placement_party1,
         covidplacement_government_median= tradeof_health_econ_party1,
         covidplacement_government_mean= tradeof_health_econ_party1) %>% 
  ungroup() %>%
  mutate(generalplacement_government_median= median(ideology_placement_party1, na.rm = TRUE),
         generalplacement_government_mean= mean(ideology_placement_party1, na.rm = TRUE),
         generalcovidplacement_government_median= median(tradeof_health_econ_party1, na.rm = TRUE),
         generalcovidplacement_government_mean= mean(tradeof_health_econ_party1, na.rm = TRUE))%>% 
  select(id:weight, placement_government_median:generalcovidplacement_government_mean)

gov_parties_it <- df %>% 
  filter(country== "IT") %>% 
  rowwise() %>% 
  mutate(placement_government_median= median(ideology_placement_party2, ideology_placement_party3, na.rm =TRUE),
         placement_government_mean= mean(c(ideology_placement_party2, ideology_placement_party3), na.rm =TRUE),
         covidplacement_government_median= median(tradeof_health_econ_party2, tradeof_health_econ_party3, na.rm =TRUE),
         covidplacement_government_mean= mean(c(tradeof_health_econ_party2, tradeof_health_econ_party3), na.rm =TRUE)) %>% 
  ungroup() %>% 
  mutate(generalplacement_government_median= median(ideology_placement_party2, ideology_placement_party3, na.rm =TRUE),
         generalplacement_government_mean= mean(c(ideology_placement_party2, ideology_placement_party3), na.rm =TRUE),
         generalcovidplacement_government_median= median(tradeof_health_econ_party2, tradeof_health_econ_party3, na.rm =TRUE),
         generalcovidplacement_government_mean= mean(c(tradeof_health_econ_party2, tradeof_health_econ_party3), na.rm =TRUE))%>% 
  select(id:weight, placement_government_median:generalcovidplacement_government_mean)

gov_parties_pl <- df %>% 
  filter(country== "PL") %>% 
  rowwise() %>% 
  mutate(placement_government_median= ideology_placement_party1,
         placement_government_mean= ideology_placement_party1,
         covidplacement_government_median=tradeof_health_econ_party1,
         covidplacement_government_mean=tradeof_health_econ_party1) %>% 
  ungroup() %>%
  mutate(generalplacement_government_median= median(ideology_placement_party1, na.rm =TRUE),
         generalplacement_government_mean= mean(ideology_placement_party1, na.rm =TRUE),
         generalcovidplacement_government_median= median(tradeof_health_econ_party1, na.rm =TRUE),
         generalcovidplacement_government_mean= mean(tradeof_health_econ_party1, na.rm =TRUE)) %>% 
  select(id:weight, placement_government_median:generalcovidplacement_government_mean)

gov_parties_fr <- df %>% 
  filter(country== "FR") %>% 
  rowwise() %>% 
  mutate(placement_government_median= ideology_placement_party1,
         placement_government_mean= ideology_placement_party1,
         covidplacement_government_median= tradeof_health_econ_party1,
         covidplacement_government_mean= tradeof_health_econ_party1) %>% 
  ungroup() %>%
  mutate(generalplacement_government_median= median(ideology_placement_party1, na.rm =TRUE),
         generalplacement_government_mean= mean(ideology_placement_party1, na.rm =TRUE),
         generalcovidplacement_government_median= median(tradeof_health_econ_party1, na.rm = T),
         generalcovidplacement_government_mean= mean(tradeof_health_econ_party1, na.rm = TRUE)) %>% 
  select(id:weight, placement_government_median:generalcovidplacement_government_mean)


gov_parties_sw <- df %>% 
  filter(country== "SW") %>% 
  rowwise() %>% 
  mutate(placement_government_median= ideology_placement_party1,
         placement_government_mean= ideology_placement_party1,
         covidplacement_government_median= tradeof_health_econ_party1,
         covidplacement_government_mean= tradeof_health_econ_party1) %>% 
  ungroup() %>%
  mutate(generalplacement_government_median= median(ideology_placement_party1, na.rm = TRUE),
         generalplacement_government_mean= mean(ideology_placement_party1, na.rm = TRUE),
         generalcovidplacement_government_median= median(tradeof_health_econ_party1, na.rm = TRUE),
         generalcovidplacement_government_mean= mean(tradeof_health_econ_party1, na.rm = TRUE)) %>% 
  select(id:weight, placement_government_median:generalcovidplacement_government_mean)

gov_parties <- gov_parties_de %>% 
  add_case(gov_parties_sp) %>% 
  add_case(gov_parties_fr) %>% 
  add_case(gov_parties_it) %>% 
  add_case(gov_parties_pl) %>% 
  add_case(gov_parties_sw) 

df <- full_join(df, gov_parties) 

df <- df %>% 
  rowwise() %>% 
  mutate(government_distanter_median= abs(ideology_selfplacement - placement_government_median),
         government_distanter_mean= abs(ideology_selfplacement - placement_government_mean),
         covidgovernment_distanter_median= abs(tradeof_health_econ - covidplacement_government_median),
         covidgovernment_distanter_mean= abs(tradeof_health_econ - covidplacement_government_mean),
         generalgovernment_distanter_median=  abs(ideology_selfplacement - generalplacement_government_median),
         generalgovernment_distanter_mean=  abs(ideology_selfplacement - generalplacement_government_mean),
         generalcovidgovernment_distanter_median= abs(tradeof_health_econ - generalcovidplacement_government_median),
         generalcovidgovernment_distanter_mean= abs(tradeof_health_econ - generalcovidplacement_government_mean))
  
rm(gov_parties, gov_parties_de, gov_parties_it, gov_parties_fr,
   gov_parties_sp, gov_parties_sw, gov_parties_pl)  

# DE: AfD (ptv, ideology, tradeoff: party4; vote choice & pid: option4)
# FR: FN (ptv, ideology, tradeoff: party2; vote choice & pid: option2)
# IT: LN (ptv, ideology, tradeoff: party1; vote choice & pid: option1)
# IT: M5S (ptv, ideology, tradeoff: party3; vote choice & pid: option3)
# IT: FdI (ptv, ideology, tradeoff: party5; vote choice & pid: option5)
# PL: PiS (ptv, ideology, tradeoff: party1; vote choice & pid: option1)
# SP: Vox (ptv, ideology, tradeoff: party5; vote choice & pid: option5)
# SW: SD (ptv, ideology, tradeoff: party3; vote choice & pid: option3)

d <- df %>% 
  filter(country != "IT") %>% 
  mutate(pop_ptv = NA,
         pop_ptv = ifelse(country=="DE", ptv_party4, pop_ptv),
         pop_ptv = ifelse(country=="FR", ptv_party2, pop_ptv),
         pop_ptv = ifelse(country=="PL", ptv_party1, pop_ptv),
         pop_ptv = ifelse(country=="SP", ptv_party5, pop_ptv),
         pop_ptv = ifelse(country=="SW", ptv_party3, pop_ptv),
         pop_party = NA,
         pop_party = ifelse(country=="DE", "AfD", pop_party),
         pop_party = ifelse(country=="FR", "Rassemblement national", pop_party),
         pop_party = ifelse(country=="PL", "Prawo i Sprawiedliwość", pop_party),
         pop_party = ifelse(country=="SP", "Vox", pop_party),
         pop_party = ifelse(country=="SW", "Sverigedemokraterna", pop_party),
         pop_vote_intention = 0,
         pop_vote_intention = ifelse(country == "DE" & vote_intention == "AfD", 1, pop_vote_intention),
         pop_vote_intention = ifelse(country == "FR" & vote_intention == "Rassemblement national", 1, pop_vote_intention),
         pop_vote_intention = ifelse(country == "PL" & vote_intention == "Prawo i Sprawiedliwość", 1, pop_vote_intention),
         pop_vote_intention = ifelse(country == "SP" & vote_intention == "Vox", 1, pop_vote_intention),
         pop_vote_intention = ifelse(country == "SW" & vote_intention == "Sverigedemokraterna", 1, pop_vote_intention),
         pop_vote_recall = 0,
         pop_vote_recall = ifelse(country == "DE" & vote_recall == "AfD", 1, pop_vote_recall),
         pop_vote_recall = ifelse(country == "FR" & vote_recall == "Front national", 1, pop_vote_recall),
         pop_vote_recall = ifelse(country == "PL" & vote_recall == "Prawo i Sprawiedliwość", 1, pop_vote_recall),
         pop_vote_recall = ifelse(country == "SP" & vote_recall == "Vox",1, pop_vote_recall),
         pop_vote_recall = ifelse(country == "SW" & vote_recall == "Sverigedemokraterna", 1, pop_vote_recall),
         pop_pid = 0,
         pop_pid = ifelse(country == "DE" & pid == "AfD", 1, pop_pid),
         pop_pid = ifelse(country == "FR" & pid == "Rassemblement national", 1, pop_pid),
         pop_pid = ifelse(country == "PL" & pid == "Prawo i Sprawiedliwość", 1, pop_pid),
         pop_pid = ifelse(country == "SP" & pid == "Vox",1, pop_pid),
         pop_pid = ifelse(country == "SW" & pid == "Sverigedemokraterna", 1, pop_pid)
         )

it1 <- df %>% 
  filter(country == "IT") %>% 
  mutate(pop_ptv = ptv_party1,
         pop_party = "Lega Salvini Premier",
         pop_vote_intention = ifelse(vote_intention == "Lega Salvini Premier", 1, 0),
         pop_vote_recall = ifelse(vote_recall == "Lega", 1, 0),
         pop_pid = ifelse(pid == "Lega Salvini Premier", 1, 0)
)

it2 <- df %>% 
  filter(country == "IT") %>% 
  mutate(pop_ptv = ptv_party3,
         pop_party = "Movimento 5 Stelle",
         pop_vote_recall = ifelse(vote_recall == "Movimento 5 Stelle (M5S)", 1, 0),
         pop_vote_intention = ifelse(vote_intention == "Movimento 5 Stelle (M5S)", 1, 0),
         pop_pid = ifelse(pid == "Movimento 5 Stelle (M5S)", 1, 0)
  )

it3 <- df %>% 
  filter(country == "IT") %>% 
  mutate(pop_ptv = ptv_party5,
         pop_party = "Fratelli d'Italia",
         pop_vote_intention = ifelse(vote_intention == "Fratelli d'Italia (FdI)", 1, 0),
         pop_vote_recall = ifelse(vote_recall == "Fratelli d'Italia (FdI)", 1, 0),
         pop_pid = ifelse(pid == "Fratelli d'Italia (FdI)", 1, 0)
  )

df <- d %>% 
  add_case(it1) %>%
  add_case(it2) %>%
  add_case(it3) 

rm(it1, it2, it3, d)

df <- df %>% 
  select(id, country, pop_party, wave, weight,
         #dependent variables
         picom_index, covidconsp_index,
         #independent variables
         pop_ptv, pop_vote_intention, pop_vote_recall, pop_pid, #h1
         government_distanter_median:generalcovidgovernment_distanter_mean, #h2
         #controls
         ideology_selfplacement,
         gender:tradeof_freedom_econ,
         tradeof_health_jobs:gender_workforce,
         #indicating missing imputation <10%
         missing_conspiracycovid1:missing_picom5
  )

w1 <-  df %>% 
  filter(wave==1) %>% 
  select(id, pop_party, country, wave, weight,
         #dependent variables
         covidconsp_index,
         #independent variables
         pop_vote_intention, pop_pid, #h1
         government_distanter_median:generalcovidgovernment_distanter_mean, #h2
         #controls
         ideology_selfplacement, gender:tradeof_freedom_econ,
         tradeof_health_jobs:gender_workforce,
         #indicating missing imputation <10%
         missing_conspiracycovid1:missing_picom5,
         -living_situation, -tradeof_covid, -eu_perf_econ_future
  ) %>% complete() 

w2 <-  df %>% 
  filter(wave==2) %>% 
  select(id, pop_party, country, wave, weight,
         #dependent variables
         picom_index, covidconsp_index,
         #independent variables
         pop_ptv, pop_vote_recall, pop_vote_intention, pop_vote_recall, pop_pid, #h1
         government_distanter_median:generalcovidgovernment_distanter_mean, #h2
         #controls
         gender:tradeof_freedom_econ,
         tradeof_health_jobs:gender_workforce,
         #indicating missing imputation <10%
         missing_conspiracycovid1:missing_picom5,
  ) %>% complete() 
