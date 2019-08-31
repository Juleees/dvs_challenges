TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    JOB.DATAVIS.GOALS = toupper(JOB.DATAVIS.GOALS)
  ) 



TEMP$JOB.DATAVIS.GOALS <-  gsub(", ", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub(",", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub("; ", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub(";", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub(" ;", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub(" AND ", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub("/ ", ",", TEMP$JOB.DATAVIS.GOALS )
TEMP$JOB.DATAVIS.GOALS <-  gsub("/", ",", TEMP$JOB.DATAVIS.GOALS )




TEMP <- TEMP %>% separate(JOB.DATAVIS.GOALS, c("ONE",
                                                    "TWO",
                                                    "THREE",
                                                    "FOUR",
                                                    "FIVE",
                                                    "SIX",
                                                    "SEVEN",
                                                    "EIGHT",
                                                    "NINE",
                                                    "TEN",
                                                    "ELEVEN",
                                                    "TWELVE",
                                                    "THIRTEEN",
                                                    "FOURTEEN",
                                                    "FIFTEEN",
                                                    "SIXTEEN",
                                                    "SEVENTEEN",
                                                    "EIGHTEEN",
                                                    "NINETEEN",
                                                    "TWENTY", 
                                                    "TWENTYONE",
                                                    "TWENTYTWO",
                                                    "TWENTYTHREE",
                                                    "TWENTYFOUR",
                                                    "TWENTYFIVE",
                                                    "TWENTYSIX"), ",") %>% 
  select(YEAR,
         REGION,
         ONE,
         TWO,
         THREE,
         FOUR,
         FIVE,
         SIX,
         SEVEN,
         EIGHT,
         NINE,
         TEN,
         ELEVEN,
         TWELVE,
         THIRTEEN,
         FOURTEEN,
         FIFTEEN,
         SIXTEEN,
         SEVENTEEN,
         EIGHTEEN,
         NINETEEN,
         TWENTY,
         TWENTYONE,
         TWENTYTWO,
         TWENTYTHREE,
         TWENTYFOUR,
         TWENTYFIVE,
         TWENTYSIX
  )


TEMP <- gather(TEMP,VALUE,NAME, -YEAR, -REGION) %>% 
  select(YEAR, REGION, NAME)


TEMP <- TEMP %>% 
  mutate(
    NAME = case_when(
      grepl("PRODUCT", NAME) ~ "PRODUCT",
      grepl("ANALY", NAME) ~ "ANALYSIS",
      grepl("TEACH", NAME) ~ "EDUCATION",
      grepl("RESEARCH", NAME) ~ "RESEARCH",
      grepl("NEWS", NAME) ~ "JOURNALISM",
      grepl("STORYTELLING", NAME) ~ "STORYTELLING",
      grepl("REPORT", NAME) ~ "REPORTING",
      T ~ NAME
    )
  )

# 
# 11854
# TEMP %>%
#   subset(NAME != "-") %>%
#   subset(!is.na(NAME)) %>% View()
# 


TEMP %>%
  subset(NAME != "-") %>%
  group_by(NAME) %>%
  summarise(count = n()) %>%
  mutate(
    percentage = 100*count/ 11854,
    percentage = round(percentage, digits = 2)
  ) %>% View()




filter <- TEMP %>% 
  subset(NAME != "-") %>% 
  subset(!is.na(NAME)) %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>% 
  mutate(
    percentage = 100*count/ 11854,
    percentage = round(percentage, digits = 2)
  ) %>% 
  subset(count > 10) 

sum(filter$percentage)
names <- filter$NAME


TEMP <- TEMP %>% 
  subset(NAME != "-") %>% 
  subset(!is.na(NAME)) %>% 
  mutate(
    NAME = case_when(
      NAME %nin% names ~ "OTHER",
      T ~ NAME
    )
  )



TEMP %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>%  View()


DATAVIS.GOALS <- TEMP

