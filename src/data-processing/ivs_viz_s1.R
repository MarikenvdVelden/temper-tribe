p1 <- d %>% 
  select(gender) %>%
  group_by(gender) %>% 
  summarise(n = n()) %>% 
  mutate(perc = n/dim(d)[1]) %>% 
  ggplot(aes(x = gender, y = perc)) +
  geom_col(fill = fig_cols[6]) + 
  scale_y_continuous(labels = scales::percent) +
  labs(x = "", y = "", title = "Gender") +
  theme_ipsum()

p2 <- d %>% 
    select(age) %>%
    group_by(age) %>% 
    summarise(n = n()) %>% 
    mutate(perc = n/dim(d)[1]) %>% 
    ggplot(aes(x = age, y = perc)) +
    geom_col(fill = fig_cols[6]) + 
    scale_y_continuous(labels = scales::percent) +
    labs(x = "", y = "", title = "Age") +
    theme_ipsum()

p3 <- d %>% 
  select(education) %>%
  group_by(education) %>% 
  summarise(n = n()) %>% 
  mutate(perc = n/dim(d)[1],
         education = factor(education),
         education = recode(education,
                            `1` = "1 \n (Low)",
                            `7` = "7 \n (High)"),
         education = factor(education,
                            levels = c("1 \n (Low)", "2", "3",
                                       "4", "5", "6", "7 \n (High)"))) %>%  
  ggplot(aes(x = education, y = perc)) +
  geom_col(fill = fig_cols[6]) + 
  scale_y_continuous(labels = scales::percent) +
  labs(x = "", y = "", title = "Education") +
  theme_ipsum()

p4 <- d %>% 
    select(ideology) %>%
    group_by(ideology) %>% 
    summarise(n = n()) %>% 
    mutate(perc = n/dim(d)[1],
           ideology = 11 - ideology,
           ideology = factor(ideology),
           ideology = recode(ideology,
                              `0` = "0 \n (Left)",
                              `10` = "10 \n (Right)"),
           ideology = factor(ideology,
                              levels = c("0 \n (Left)", "1", "2", "3","4", "5",
                                         "6", "7", "8", "9", "10 \n (Right)"))) %>%  
    ggplot(aes(x = ideology, y = perc)) +
    geom_col(fill = fig_cols[6]) + 
    scale_y_continuous(labels = scales::percent) +
    labs(x = "", y = "", title = "Political Ideology") +
    theme_ipsum() 



