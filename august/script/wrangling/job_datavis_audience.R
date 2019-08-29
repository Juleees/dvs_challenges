TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    JOB.DATAVIS.AUDIENCE = toupper(JOB.DATAVIS.AUDIENCE)
  ) 


TEMP$JOB.DATAVIS.AUDIENCE <-  gsub(", ", ",", TEMP$JOB.DATAVIS.AUDIENCE )
TEMP$JOB.DATAVIS.AUDIENCE <-  gsub(",", ",", TEMP$JOB.DATAVIS.AUDIENCE )
TEMP$JOB.DATAVIS.AUDIENCE <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.AUDIENCE )
TEMP$JOB.DATAVIS.AUDIENCE <-  gsub("; ", ",", TEMP$JOB.DATAVIS.AUDIENCE )
TEMP$JOB.DATAVIS.AUDIENCE <-  gsub(";", ",", TEMP$JOB.DATAVIS.AUDIENCE )
TEMP$JOB.DATAVIS.AUDIENCE <-  gsub(" ;", ",", TEMP$JOB.DATAVIS.AUDIENCE )
TEMP$JOB.DATAVIS.AUDIENCE <-  gsub(" AND ", ",", TEMP$JOB.DATAVIS.AUDIENCE )


TEMP <- TEMP %>% separate(JOB.DATAVIS.AUDIENCE, c("ONE",
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
                                                "TWELVE"), ",") %>% 
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
         TWELVE
  )

TEMP <- gather(TEMP,VALUE,NAME, -YEAR, -REGION) %>% 
  select(YEAR, REGION, NAME)

TEMP <- TEMP %>% 
  mutate(
    NAME = case_when(
      grepl("STUDENT", NAME) ~ "STUDENT",
      
      grepl("ADMIN", NAME) ~ "ADMINISTRATION",
      grepl("EXEC", NAME) ~ "EXECUTIVES",
      grepl("BUSIN", NAME) ~ "EXECUTIVES",
      grepl("ANALYST", NAME) ~ "ANALYSTS",
      grepl("SCIEN", NAME) ~ "SCIENTISTS",
      grepl("ENGINEERS", NAME) ~ "ENGINEERS",
      grepl("CLIENTS", NAME) ~ "CLIENTS",
      grepl("RESEARCH", NAME) ~ "RESEARCHERS",
      grepl("EDUCATORS", NAME) ~ "TEACHERS",
      grepl("TEACH", NAME) ~ "TEACHERS",
      grepl("PROFESSORS", NAME) ~ "TEACHERS",
      grepl("FACULTY", NAME) ~ "TEACHERS",
      grepl("MARKET", NAME) ~ "MARKETING",
      grepl("CUSTOMER", NAME) ~ "CUSTOMERS",
      grepl("SALES", NAME) ~ "SALES",
      grepl("BOARD", NAME) ~ "BOARD MEMBERS",
      grepl("GOVERN", NAME) ~ "GOVERNMENT",
      grepl("JOURNAL", NAME) ~ "JOURNALISTS",
      grepl("MEDIA", NAME) ~ "JOURNALISTS",
      grepl("NEWS", NAME) ~ "JOURNALISTS",
      grepl("POLICY", NAME) ~ "POLICY MAKERS",
      grepl("POLITICIAN", NAME) ~ "POLICY MAKERS",
      grepl("STAFF", NAME) ~ "STAFF",
      grepl("NON", NAME) ~ "NONPROFITS",
      grepl("NGO", NAME) ~ "NONPROFITS",
      grepl("ACADEMIC", NAME) ~ "ACADEMICS",
      grepl("HEALTH", NAME) ~ "MEDICAL PROFESSIONALS",
      T ~ NAME
    )
  ) 


# 9154
# TEMP %>% 
#   subset(!is.na(NAME)) %>% View()
#   
# 
# 
# TEMP %>% 
#   group_by(NAME) %>% 
#   summarise(count = n()) %>%
#   mutate(
#     percentage = 100*count/ 9154
#   ) %>% View()
#   
#   
#   
  
filter <- TEMP %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>% 
  subset(count > 10) 

names <- filter$NAME

TEMP <- TEMP %>% 
  mutate(
    NAME = case_when(
      NAME %nin% names ~ "OTHER",
      T ~ NAME
    )
  )
  
DATAVIS.AUDIENCE <- TEMP

rm(TEMP, filter)
