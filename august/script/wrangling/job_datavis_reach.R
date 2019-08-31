
TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    JOB.DATAVIS.REACH = toupper(JOB.DATAVIS.REACH)
  ) 



TEMP$JOB.DATAVIS.REACH <-  gsub(", ", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub(",", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub("; ", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub(";", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub(" ;", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub(" AND ", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub("/ ", ",", TEMP$JOB.DATAVIS.REACH )
TEMP$JOB.DATAVIS.REACH <-  gsub("/", ",", TEMP$JOB.DATAVIS.REACH )



TEMP <- TEMP %>% separate(JOB.DATAVIS.REACH, c("ONE",
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



STUDENT

TEMP <- TEMP %>% 
  mutate(
    NAME = case_when(
      grepl("RESEARCH", NAME) ~ "RESEARCH",
      grepl("ACADEMI", NAME) ~ "RESEARCH",
      grepl("STUDENT", NAME) ~ "EDUCATION",
      grepl("COMM", NAME) ~ "COMMUNICATION",
      grepl("SO THIS DOESN'T APPLY", NAME) ~ "-",
      grepl("SUPPLY", NAME) ~ "OPERATIONS",
      grepl("EDI", NAME) ~ "JOURNALISM",
      grepl("FREE", NAME) ~ "FREELANCE",
      T ~ NAME
    )
  )






3791 
TEMP %>%
  subset(NAME != "-") %>%
  subset(!is.na(NAME)) %>% View()



TEMP %>%
  subset(NAME != "-") %>%
  group_by(NAME) %>%
  summarise(count = n()) %>%
  mutate(
    percentage = 100*count/ 3791,
    percentage = round(percentage, digits = 2)
  ) %>% View()


###

filter <- TEMP %>% 
  subset(NAME != "-") %>% 
  subset(!is.na(NAME)) %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>% 
  mutate(
    percentage = 100*count/ 3791,
    percentage = round(percentage, digits = 2)
  ) %>% 
  subset(count >= 5) 

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


DATAVIS.REACH <- TEMP
