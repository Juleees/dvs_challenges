
write_csv(AUDIENCE.DATAVISUSE,
          here::here("output-data", "audience_datavis_use.csv"))


write_csv(CHARTS.USED,
          here::here("output-data", "audience_datavis_chart_used.csv"))

write_csv(DATAVIS.AUDIENCE,
          here::here("output-data", "audience_datavis.csv"))


write_csv(DATAVIS.GOALS,
          here::here("output-data", "datavis_goals.csv"))


write_csv(DATAVIS.PRESENTATION,
          here::here("output-data", "datavis_presentation.csv"))


write_csv(EDU.METHODS,
          here::here("output-data", "edu_methods.csv"))

write_csv(COMM.LEADERS,
          here::here("output-data", "comm_leaders.csv"))



TEMP <- ALL.YEARS




TEMP <- TEMP %>% 
  mutate(
    JOB.DESIGN.HOURS = ifelse(YEAR %in% c("2018"), NA, as.numeric(as.character(JOB.DESIGN.HOURS))),
    JOB.DATASCI.HOURS = ifelse(YEAR %in% c("2018"), NA, as.numeric(as.character(JOB.DATASCI.HOURS))),
    JOB.DATAVIS.HOURS = ifelse(YEAR %in% c("2018"), NA, as.numeric(as.character(JOB.DATAVIS.HOURS))),
    JOB.PREPWORK.HOURS = ifelse(YEAR %in% c("2018"), NA, as.numeric(as.character(JOB.PREPWORK.HOURS))),
    JOB.PORTFOLIO.HOURS = ifelse(YEAR %in% c("2018"), NA, as.numeric(as.character(JOB.PORTFOLIO.HOURS))),
    JOB.ENGINEERING.HOURS = ifelse(YEAR %in% c("2018"), NA, as.numeric(as.character(JOB.ENGINEERING.HOURS)))
  ) 
  
 #  
 # test <- TEMP %>% select(
 #   YEAR,
 #    JOB.DESIGN.HOURS,
 #    JOB.DATASCI.HOURS,
 #    JOB.DATAVIS.HOURS,
 #    JOB.PREPWORK.HOURS,
 #    JOB.PORTFOLIO.HOURS,
 #    JOB.ENGINEERING.HOURS 
 #  )
 # 
 
 TEMP$TOTAL.HOURS <-  
   test$JOB.DESIGN.HOURS +
   test$JOB.DATASCI.HOURS +
   test$JOB.DATAVIS.HOURS +
   test$JOB.PREPWORK.HOURS +
   test$JOB.PORTFOLIO.HOURS +
   test$JOB.ENGINEERING.HOURS

   
 
 

TEMP <-  TEMP %>% 
  mutate(
    JOB.DESIGN.HOURS.PERC = 100*JOB.DESIGN.HOURS/TOTAL.HOURS,
    JOB.DESIGN.HOURS.PERC = round(JOB.DESIGN.HOURS.PERC, digits = 2),
    JOB.DATASCI.HOURS.PERC = 100*JOB.DATASCI.HOURS/TOTAL.HOURS,
    JOB.DESIGN.HOURS.PERC = round(JOB.DATASCI.HOURS.PERC, digits = 2),
    JOB.DATAVIS.HOURS.PERC = 100*JOB.DATAVIS.HOURS/TOTAL.HOURS,
    JOB.DESIGN.HOURS.PERC = round(JOB.DATAVIS.HOURS.PERC, digits = 2),
    JOB.PREPWORK.HOURS.PERC = 100*JOB.PREPWORK.HOURS/TOTAL.HOURS,
    JOB.DESIGN.HOURS.PERC = round(JOB.PREPWORK.HOURS.PERC, digits = 2),
    JOB.PORTFOLIO.HOURS.PERC = 100*JOB.PORTFOLIO.HOURS/TOTAL.HOURS,
    JOB.DESIGN.HOURS.PERC = round(JOB.PORTFOLIO.HOURS.PERC, digits = 2),
    JOB.ENGINEERING.HOURS.PERC = 100*JOB.ENGINEERING.HOURS/TOTAL.HOURS,
    JOB.DESIGN.HOURS.PERC = round(JOB.ENGINEERING.HOURS.PERC, digits = 2)
  )


ALL.YEARS <- TEMP

ALL.YEARS <-  ALL.YEARS %>% select(
  -c(
    JOB.DATAVIS.ASPIRATION,
    JOB.DATAVIS.CHANGE,
    JOB.DATAVIS.FRUSTRATION,
    JOB.DATAVIS.LEADERSHIP,
    JOB.DATAVIS.PERSONALKNOWLEDGE
    
    
  )
)

write_csv(ALL.YEARS,
          here::here("output-data", "all_surveys_clean.csv"))


