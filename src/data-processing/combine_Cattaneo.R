#combine countries
source(here("src/data-processing/clean_Cattaneo_DE.R"))
source(here("src/data-processing/clean_Cattaneo_FR.R"))
source(here("src/data-processing/clean_Cattaneo_IT.R"))
source(here("src/data-processing/clean_Cattaneo_PL.R"))
source(here("src/data-processing/clean_Cattaneo_SP.R"))
source(here("src/data-processing/clean_Cattaneo_SWE.R"))

df <- bind_rows(de, fr, it, pl, sw, sp) %>% 
  select(id:picom5, conspiracycovid1:conspiracycovid4,
         type_conspiricy_question,
         ptv_party1 = pvt_party1, 
         ptv_party2 = pvt_party2, 
         ptv_party3 = pvt_party3, 
         ptv_party4 = pvt_party4, 
         ptv_party5 = pvt_party5,
         ptv_party6 = pvt_party6, 
         ptv_party7 = pvt_party7, 
         ptv_party8 = pvt_party8, 
         ptv_party9 = pvt_party9, 
         ptv_party10 = pvt_party10,
         ptv_party11 = pvt_party11, 
         ptv_party12 = pvt_party12, 
         ptv_party13 = pvt_party13, 
         ptv_party14 = pvt_party14,
         pid:ideology_placement_party6,
         gender:gender_workforce,
         pop1 = pol_efficacy1,
         pop2 = pol_efficacy2,
         pop3 = pol_efficacy3,
         pop4 = pol_efficacy4,
         pop5 = pol_efficacy5,
         pop6 = affective_pol1,
         pop7 = affective_pol2) 
rm(de, fr, it, pl, sw, sp)

#Missings 
source(here("src/data-processing/missings_Cattaneo.R"))

#Scaling: Picom, Covid, populism, trust
source(here("src/data-processing/scaling_Cattaneo.R"))

#Variables: Underrepresentation (placement inside/outside range), cartelization, relative polarization
source(here("src/data-processing/operationalizations_Cattaneo.R"))



