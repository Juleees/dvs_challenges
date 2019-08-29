TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    JOB.DATAVIS.AUDIENCEDATAVISUSE = toupper(JOB.DATAVIS.AUDIENCEDATAVISUSE)
  ) 


TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub(", ", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub(",", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub("; ", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub(";", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub(" ;", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub(" AND ", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub("/ ", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )
TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE <-  gsub("/", ",", TEMP$JOB.DATAVIS.AUDIENCEDATAVISUSE )


TEMP <- TEMP %>% separate(JOB.DATAVIS.AUDIENCEDATAVISUSE, c("ONE",
                                                  "TWO",
                                                  "THREE",
                                                  "FOUR",
                                                  "FIVE",
                                                  "SIX",
                                                  "SEVEN",
                                                  "EIGHT",
                                                  "NINE"), ",") %>% 
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
         NINE
  )

TEMP <- gather(TEMP,VALUE,NAME, -YEAR, -REGION) %>% 
  select(YEAR, REGION, NAME)

TEMP <- TEMP %>% 
  mutate(
    NAME = case_when(
      grepl("DECISION", NAME) ~ "DECISION MAKING",
      grepl("BUSINESS", NAME) ~ "DECISION MAKING",
      
      grepl("TEACH", NAME) ~ "EDUCATION",
      grepl("NEWS", NAME) ~ "NEWS",
      grepl("COMMUN", NAME) ~ "COMMUNICATION",
      grepl("POLI", NAME) ~ "POLICY MAKING",
      grepl("STRATEGY", NAME) ~ "DECISION MAKING",
      grepl("MONITORING", NAME) ~ "MONITORING OPERATIONS",
      grepl("OPERATIONS", NAME) ~ "MONITORING OPERATIONS",
      grepl("MANAGEMENT", NAME) ~ "MONITORING OPERATIONS",
      grepl("PLANNING", NAME) ~ "MONITORING OPERATIONS",
      # grepl("TEACH", NAME) ~ "TEACHERS",
      # grepl("PROFESSORS", NAME) ~ "TEACHERS",
      # grepl("FACULTY", NAME) ~ "TEACHERS",
      # grepl("MARKET", NAME) ~ "MARKETING",
      # grepl("CUSTOMER", NAME) ~ "CUSTOMERS",
      # grepl("SALES", NAME) ~ "SALES",
      # grepl("BOARD", NAME) ~ "BOARD MEMBERS",
      # grepl("GOVERN", NAME) ~ "GOVERNMENT",
      # grepl("JOURNAL", NAME) ~ "JOURNALISTS",
      # grepl("MEDIA", NAME) ~ "JOURNALISTS",
      # grepl("NEWS", NAME) ~ "JOURNALISTS",
      # grepl("POLICY", NAME) ~ "POLICY MAKERS",
      # grepl("POLITICIAN", NAME) ~ "POLICY MAKERS",
      # grepl("STAFF", NAME) ~ "STAFF",
      # grepl("NON", NAME) ~ "NONPROFITS",
      # grepl("NGO", NAME) ~ "NONPROFITS",
      # grepl("ACADEMIC", NAME) ~ "ACADEMICS",
      # grepl("HEALTH", NAME) ~ "MEDICAL PROFESSIONALS",
      T ~ NAME
    )
  )

# 
# 8389
# TEMP %>%
#   subset(!is.na(NAME)) %>% View()
# 
# 
# 
# TEMP %>%
#   group_by(NAME) %>%
#   summarise(count = n()) %>%
#   mutate(
#     percentage = 100*count/ 8389
#   ) %>% View()




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

TEMP %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>%
    mutate(
      percentage = 100*count/ 8389,
      percentage = round(percentage, digits = 1)
    ) %>% View()

AUDIENCE.DATAVISUSE <- TEMP

rm(TEMP, filter)