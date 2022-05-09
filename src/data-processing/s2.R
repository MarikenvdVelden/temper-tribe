d <- read_sav(here("data/raw-private/Dataset STUDY 2.sav")) %>% 
  zap_labels() %>% 
  mutate(age = 2019 - (1918 + Leeftijd),
         education = 8 - edu,
         gender = recode(sex,
                         `1` = "Male",
                         `2` = "Female",
                         .default = "Male",
                         .missing = "Male")) %>% 
  select(id = ID, age, gender, education, 
         ideology = Political_orientation,
         cb1 = PICOM1, cb2 = PICOM2, 
         cb3 = PICOM3, cb4 = PICOM4, 
         cb5 = PICOM5, 
         cl1 = Links1, cl2 = Links2, cl3 = Links3, cl4 = Links4,
         cr1 = Rechts1, cr2 = Rechts2, cr3 = Rechts3, cr4 = Rechts4,
         weight = weight_trimmed_0.995)

