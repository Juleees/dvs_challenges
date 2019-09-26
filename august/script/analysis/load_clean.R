library(tidyverse)
 

comp.survey <- read_csv(
  here::here("output-data", "all_surveys_clean.csv")
)


sa.countries <- c("Latin America and the Caribbean", "South America",
                  "Argentina", "Bolivia (Plurinational State of)", "Bolivia",
                  "Brazil", "Chile", "Colombia", "Ecuador", "French Guiana",
                  "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay",
                  "Venezuela (Bolivarian Republic of)", "Venezuela", "Venezuela, RB",
                  "Mexico", "México", "Guatemala", "Haiti", "Dominican Republic", 
                  "Honduras", "Nicaragua", "El Salvador", "Costa Rica", "Panama", "Cuba")


sa.countries <- toupper(sa.countries)


comp.survey %>% 
  subset(YEAR > 2017) %>% 
  group_by(COUNTRY, YEAR) %>% 
  tally() %>% 
  subset(COUNTRY %in% sa.countries) %>% 
  complete(YEAR = 2018:2019,
           nesting(COUNTRY),
           fill = list(n = 0)) %>% 
  View()



comp.survey %>% 
  subset(YEAR > 2017) %>% 
  mutate(
    COUNTRY = case_when(
      COUNTRY %in% sa.countries ~ COUNTRY,
      T ~ "WORLD"
    )
  ) %>% 
  group_by(COUNTRY, YEAR) %>% 
  summarise(
    work.hours = median(TOTAL.HOURS, na.rm = T),
    mean.work.hours = mean(TOTAL.HOURS, na.rm = T),
    experience = median(EXPERIENCE.DATAVIS.YEARS, na.rm = T),
    max.experience = max(EXPERIENCE.DATAVIS.YEARS, na.rm = T)
  ) %>% 
  View()



comp.survey %>% 
  subset(YEAR > 2018) %>% 
  mutate(
    COUNTRY = case_when(
      COUNTRY %in% sa.countries ~ COUNTRY,
      T ~ "WORLD"
    )
  ) %>% 
  group_by(COUNTRY, YEAR, FREELANCE.OR.CONSULTANT) %>% 
  summarise(
    count = n()
  ) %>% 
  View()
