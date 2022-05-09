descr <- d %>%
  drop_na(weight) %>% 
  mutate(gender = if_else(gender == "Male", 1, 0)) %>%
  select(age:cb5, cb) %>%
  pivot_longer(cols = everything(),
               names_to = "Variables") %>%
  group_by(Variables) %>%
  summarise(`Mean Value` = mean(value, na.rm = T),
            `St. Dev` = sd(value, na.rm = T),
            `Min. Value` = min(value, na.rm = T),
            `Max. Value` = max(value, na.rm = T)) %>%
  ungroup() %>%
  mutate(Variables = recode(Variables,
                            `age` = "Age",
                            `gender` = "Gender",
                            `education`  = "Level of Education",
                            `ideology` = "Political Ideology",
                            `cb1` = "DV: Conspiracy Belief (1)",
                            `cb2` = "DV: Conspiracy Belief (2)",
                            `cb3` = "DV: Conspiracy Belief (3)",
                            `cb4` = "DV: Conspiracy Belief (4)",
                            `cb5` = "DV: Conspiracy Belief (5)",
                            `cb` = "DV: Conspiracy Belief (Scale)"),
         Variables = factor(Variables,
                            levels = c("DV: Conspiracy Belief (Scale)",
                                       "DV: Conspiracy Belief (1)",
                                       "DV: Conspiracy Belief (2)",
                                       "DV: Conspiracy Belief (3)",
                                       "DV: Conspiracy Belief (4)",
                                       "DV: Conspiracy Belief (5)",
                                       "Political Ideology",
                                       "Level of Education", 
                                       "Age", "Gender")))

