df <- d %>%
  summarise(`Conspiracy Belief (1)` = round(sum(is.na(cb1))/n(),2),
            `Conspiracy Belief (2)` = round(sum(is.na(cb2))/n(),2),
            `Conspiracy Belief (3)` = round(sum(is.na(cb3))/n(),2),
            `Conspiracy Belief (4)` = round(sum(is.na(cb4))/n(),2),
            `Conspiracy Belief (5)` = round(sum(is.na(cb5))/n(),2),
            `Age` = round(sum(is.na(age))/n(),2),
            `Gender` = round(sum(is.na(gender))/n(),2),
            `Education` = round(sum(is.na(education))/n(),2),
            `Ideology` = round(sum(is.na(ideology))/n(),2)) %>%
  pivot_longer(cols = `Conspiracy Belief (1)`:`Ideology`,
               names_to = "Variables", values_to = "% Missing Values")

means <- d %>%
  summarise(cb1 = round(mean(cb1, na.rm = T),0),
            cb2 = round(mean(cb2, na.rm = T),0),
            cb3 = round(mean(cb3, na.rm = T),0),
            cb4 = round(mean(cb4, na.rm = T),0),
            cb5 = round(mean(cb5, na.rm = T),0),
            age = round(mean(age, na.rm = T),0),
            gender = max(names(table(gender))),
            ideology = round(mean(ideology, na.rm = T),0),
            education = round(mean(education, na.rm = T),0))

d <- d %>%
  mutate(cb1_m = ifelse(is.na(cb1), 1, 0),
         cb2_m = ifelse(is.na(cb2), 1, 0),
         cb3_m = ifelse(is.na(cb3), 1, 0),
         cb4_m = ifelse(is.na(cb4), 1, 0),
         cb5_m = ifelse(is.na(cb5), 1, 0),
         ideology_m = ifelse(is.na(ideology), 1, 0),
         cb1 = ifelse(is.na(cb1), means$cb1, cb1),
         cb2 = ifelse(is.na(cb2), means$cb2, cb2),
         cb3 = ifelse(is.na(cb3), means$cb3, cb3),
         cb4 = ifelse(is.na(cb4), means$cb4, cb4),
         cb5 = ifelse(is.na(cb5), means$cb5, cb5),
         ideology = ifelse(is.na(ideology), means$ideology, ideology),
         age = ifelse(is.na(age), means$age, age),
         gender = ifelse(is.na(gender), means$gender, gender),
         education = ifelse(is.na(education), means$education, education))

