#Linear Regression H1
m1 <- tidy(svyglm(cb ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (Scale)")

m2 <- tidy(svyglm(cb1 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (1)")

m3 <- tidy(svyglm(cb2 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (2)")

m4 <- tidy(svyglm(cb3 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (3)")

m5 <- tidy(svyglm(cb4 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (4)")

m6 <- tidy(svyglm(cb5 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (5)")

p1 <- m1 %>%
  filter(term != "(Intercept)") %>% 
  mutate(upper = estimate + (1.96*std.error),
         lower = estimate - (1.96*std.error),
         term  = recode(term,
                        `genderMale` = "Being Male",
                        `age` = "Age",
                        `education` = "Education",
                        `ideology` = "Political Ideology")) %>% 
  select(term, estimate, upper, lower, y) %>% 
  ggplot(aes(x = term, y = estimate,
             ymin = lower, ymax = upper, color = y)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "", y = "Predicted Conspiracy Belief") +
  theme(legend.position="none",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_hline(yintercept = 0, size = .2, linetype = "dashed") +
  coord_flip() 

p2 <- m1 %>% 
  add_case(m2) %>% 
  add_case(m3) %>% 
  add_case(m4) %>% 
  add_case(m5) %>% 
  add_case(m6) %>%
  filter(term != "(Intercept)") %>% 
  mutate(upper = estimate + (1.96*std.error),
         lower = estimate - (1.96*std.error),
         term  = recode(term,
                        `genderMale` = "Being Male",
                        `age` = "Age",
                        `education` = "Education",
                        `ideology` = "Political Ideology")) %>% 
  select(term, estimate, upper, lower, y) %>% 
  ggplot(aes(x = term, y = estimate,
             ymin = lower, ymax = upper, color = y)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "", y = "Predicted Conspiracy Belief") +
  theme(legend.position="bottom",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_hline(yintercept = 0, size = .2, linetype = "dashed") +
  coord_flip() 
rm(m1, m2, m3, m4, m5, m6)

# Two-Lines Test
source(here("src/lib/two_lines_test.R"))

df <- d  %>% 
  mutate(gender = ifelse(gender == "Male", 1, 0))

## -- plot of interrupted regressions with quadratic line added: --
p3 <- ggplot(data = d, aes(x = ideology, y = cb)) +
  labs(x = "Political Ideology", y = "Conspiracy Belief") +
  ylim(c(5.7,6.5)) +
  theme_ipsum() +
  stat_smooth(aes(y = cb), method = "lm", formula = y ~ x + I(x^2),
              size = 1, color = "red",  linetype="dashed", se=FALSE) +
  geom_smooth(data = subset(d, d$ideology <= 4),method=lm, 
              color = fig_cols[6], fill = fig_cols[6]) + 
  geom_smooth(data = subset(d, d$ideology >= 4),method=lm,
              color = fig_cols[6], fill = fig_cols[6])

