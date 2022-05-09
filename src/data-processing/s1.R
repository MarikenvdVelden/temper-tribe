d <- read_sav(here("data/raw-private/DATASET STUDY 1.sav")) %>% 
  zap_labels() %>% 
  mutate(age = 2019 - (1918 + leeftijd),
         education = 8 - opleiding,
         gender = recode(geslacht,
                         `1` = "Male",
                         `2` = "Female")) %>% 
  select(id = ID, age, gender, education, ideology = Politieke_orientatie,
         cb1 = samenzwering1, cb2 = samenzwering2, 
         cb3 = samenzwering3, cb4 = samenzwering4, 
         cb5 = samenzwering5, weight = weightwave2)

