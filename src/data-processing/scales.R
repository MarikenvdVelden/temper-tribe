cb <- d %>%
  select(matches("cb\\d")) %>%
  ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, na.rm = FALSE)

cbs <- d %>%
  select(matches("c[lr]\\d")) %>%
  ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, na.rm = FALSE)

cl <- d %>%
  select(matches("cl\\d")) %>%
  ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, na.rm = FALSE)

cr <- d %>%
  select(matches("cr\\d")) %>%
  ltm::cronbach.alpha(probs = c(0.025, 0.975), B = 1000, na.rm = FALSE)

scales <- tibble(Variable = c("General Conspiracy Belief", 
                              "Elite Conspiracy Belief",
                              "Economic Elite Conspiracy Belief",
                              "Political and Cultural Elite Conspiracy Belief"),
                 `Cronbach's Alpha` = c(cb[[1]], cbs[[1]], cl[[1]], cr[[1]]))
d <- d %>% 
  mutate(cb = (cb1 + cb2 + cb3 + cb4 + cb5)/5,
         cbs = (cl1 + cl2 + cl3 + cl4 + cr1 + cr2 + cr3 + cr4)/8,
         cl = (cl1 + cl2 + cl3 + cl4)/4,
         cr = (cr1 + cr2 + cr3 + cr4)/4)

rm(cb, cbs, cl, cr)
