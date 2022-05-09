m1 <- tidy(svyglm(cb ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (Scale)",
         type = "Conspiracy Belief")

m2 <- tidy(svyglm(cb1 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (1)",
         type = "Conspiracy Belief")

m3 <- tidy(svyglm(cb2 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (2)",
         type = "Conspiracy Belief")

m4 <- tidy(svyglm(cb3 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (3)",
         type = "Conspiracy Belief")

m5 <- tidy(svyglm(cb4 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (4)",
         type = "Conspiracy Belief")

m6 <- tidy(svyglm(cb5 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Conspiracy Belief (5)",
         type = "Conspiracy Belief")

m7 <- tidy(svyglm(cbs ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Elite Conspiracy Belief (Scale)",
         type = "Elite Conspiracy Belief")

m8 <- tidy(svyglm(cl1 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Economic Elite Conspiracy Belief (1)", 
         type = "Economic Elite Conspiracy Belief")

m9 <- tidy(svyglm(cl2 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Economic Elite Conspiracy Belief (2)", 
         type = "Economic Elite Conspiracy Belief")

m10 <- tidy(svyglm(cl3 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Economic Elite Conspiracy Belief (3)", 
         type = "Economic Elite Conspiracy Belief")

m11 <- tidy(svyglm(cl4 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Economic Elite Conspiracy Belief (4)", 
         type = "Economic Elite Conspiracy Belief")

m12 <- tidy(svyglm(cl ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Economic Elite Conspiracy Belief (Scale)", 
         type = "Economic Elite Conspiracy Belief")

m13 <- tidy(svyglm(cl1 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Political and Cultural Elite Conspiracy Belief (1)", 
         type = "Political and Cultural Elite Conspiracy Belief")

m14 <- tidy(svyglm(cl2 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Political and Cultural Elite Conspiracy Belief (2)", 
         type = "Political and Cultural Elite Conspiracy Belief")

m15 <- tidy(svyglm(cl3 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Political and Cultural Elite Conspiracy Belief (3)", 
         type = "Political and Cultural Elite Conspiracy Belief")

m16 <- tidy(svyglm(cl4 ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Political and Cultural Elite Conspiracy Belief (4)", 
         type = "Political and Cultural Elite Conspiracy Belief")

m17 <- tidy(svyglm(cl ~ gender + age + education + ideology, design=dw)) %>% 
  mutate(y = "Political and Cultural Elite Conspiracy Belief (Scale)", 
         type = "Political and Cultural Elite Conspiracy Belief")

#m1, m7, m8, m12, m17
p1 <- m1 %>% 
  add_case(m6) %>% 
  add_case(m7) %>% 
  add_case(m12) %>% 
  add_case(m17) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(upper = estimate + (1.96*std.error),
         lower = estimate - (1.96*std.error),
         term  = recode(term,
                        `genderMale` = "Being Male",
                        `age` = "Age",
                        `education` = "Education",
                        `ideology` = "Political Ideology")) %>% 
  select(term, estimate, upper, lower, y, type) %>% 
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
  coord_flip() +
  guides(color=guide_legend(nrow=3,byrow=TRUE))


p2a <- m1 %>% 
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
  select(term, estimate, upper, lower, y, type) %>% 
  ggplot(aes(x = term, y = estimate,
             ymin = lower, ymax = upper, color = y)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  facet_grid(.~type) +
  labs(x = "", y = "Predicted Conspiracy Belief") +
  theme(legend.position="bottom",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_hline(yintercept = 0, size = .2, linetype = "dashed") +
  coord_flip()  +
  guides(color=guide_legend(ncol=1,byrow=TRUE))

p2b <- m7 %>% 
  filter(term != "(Intercept)") %>% 
  mutate(upper = estimate + (1.96*std.error),
         lower = estimate - (1.96*std.error),
         term  = recode(term,
                        `genderMale` = "Being Male",
                        `age` = "Age",
                        `education` = "Education",
                        `ideology` = "Political Ideology")) %>% 
  select(term, estimate, upper, lower, y, type) %>% 
  ggplot(aes(x = term, y = estimate,
             ymin = lower, ymax = upper, color = y)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  facet_grid(.~type) +
  labs(x = "", y = "Predicted Elite Conspiracy Belief") +
  theme(legend.position="bottom",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_hline(yintercept = 0, size = .2, linetype = "dashed") +
  coord_flip()  +
  guides(color=guide_legend(ncol=1,byrow=TRUE))

p2c <- m8 %>% 
  add_case(m9) %>% 
  add_case(m10) %>% 
  add_case(m11) %>% 
  add_case(m12) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(upper = estimate + (1.96*std.error),
         lower = estimate - (1.96*std.error),
         term  = recode(term,
                        `genderMale` = "Being Male",
                        `age` = "Age",
                        `education` = "Education",
                        `ideology` = "Political Ideology")) %>% 
  select(term, estimate, upper, lower, y, type) %>% 
  ggplot(aes(x = term, y = estimate,
             ymin = lower, ymax = upper, color = y)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  facet_grid(.~type) +
  labs(x = "", y = "Predicted Economic Elite Conspiracy Belief") +
  theme(legend.position="bottom",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_hline(yintercept = 0, size = .2, linetype = "dashed") +
  coord_flip()  +
  guides(color=guide_legend(nncol=1,byrow=TRUE))

p2d <- m13 %>% 
  add_case(m14) %>% 
  add_case(m15) %>% 
  add_case(m16) %>% 
  add_case(m17) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(upper = estimate + (1.96*std.error),
         lower = estimate - (1.96*std.error),
         term  = recode(term,
                        `genderMale` = "Being Male",
                        `age` = "Age",
                        `education` = "Education",
                        `ideology` = "Political Ideology")) %>% 
  select(term, estimate, upper, lower, y, type) %>% 
  ggplot(aes(x = term, y = estimate,
             ymin = lower, ymax = upper, color = y)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  facet_grid(.~type) +
  labs(x = "", y = "Predicted Political and Cultural Elite Conspiracy Belief") +
  theme(legend.position="bottom",
        legend.title = element_blank()) +
  scale_color_manual(values = fig_cols) +
  geom_hline(yintercept = 0, size = .2, linetype = "dashed") +
  coord_flip() +
  guides(color=guide_legend(ncol=1,byrow=TRUE))

rm(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10,
   m11, m12, m13, m14, m15, m16, m17)

# Two-Lines Test
source(here("src/lib/two_lines_test.R"))

df <- d  %>% 
  mutate(gender = ifelse(gender == "Male", 1, 0))

p3a <- ggplot(data = d, aes(x = ideology, y = cb)) +
  labs(x = "Political Ideology", y = "Conspiracy Belief") +
  theme_ipsum() +
  stat_smooth(aes(y = cb), method = "lm", formula = y ~ x + I(x^2),
              size = 1, color = "red",  linetype="dashed", se=FALSE) +
  geom_smooth(data = subset(d, d$ideology <= 4),method=lm, 
              color = fig_cols[6], fill = fig_cols[6]) + 
  geom_smooth(data = subset(d, d$ideology >= 4),method=lm,
              color = fig_cols[6], fill = fig_cols[6])

p3b <- ggplot(data = d, aes(x = ideology, y = cbs)) +
  labs(x = "Political Ideology", y = "Elite Conspiracy Belief") +
  theme_ipsum() +
  stat_smooth(aes(y = cbs), method = "lm", formula = y ~ x + I(x^2),
              size = 1, color = "red",  linetype="dashed", se=FALSE) +
  geom_smooth(data = subset(d, d$ideology <= 4),method=lm, 
              color = fig_cols[6], fill = fig_cols[6]) + 
  geom_smooth(data = subset(d, d$ideology >= 4),method=lm,
              color = fig_cols[6], fill = fig_cols[6])

p3c <- ggplot(data = d, aes(x = ideology, y = cl)) +
  labs(x = "Political Ideology", y = "Economic Elite Conspiracy Belief") +
  theme_ipsum() +
  stat_smooth(aes(y = cl), method = "lm", formula = y ~ x + I(x^2),
              size = 1, color = "red",  linetype="dashed", se=FALSE) +
  geom_smooth(data = subset(d, d$ideology <= 4),method=lm, 
              color = fig_cols[6], fill = fig_cols[6]) + 
  geom_smooth(data = subset(d, d$ideology >= 4),method=lm,
              color = fig_cols[6], fill = fig_cols[6])

p3d <- ggplot(data = d, aes(x = ideology, y = cr)) +
  labs(x = "Political Ideology", y = "Political and Cultural Elite Conspiracy Belief") +
  theme_ipsum() +
  stat_smooth(aes(y = cr), method = "lm", formula = y ~ x + I(x^2),
              size = 1, color = "red",  linetype="dashed", se=FALSE) +
  geom_smooth(data = subset(d, d$ideology <= 4),method=lm, 
              color = fig_cols[6], fill = fig_cols[6]) + 
  geom_smooth(data = subset(d, d$ideology >= 4),method=lm,
              color = fig_cols[6], fill = fig_cols[6])
