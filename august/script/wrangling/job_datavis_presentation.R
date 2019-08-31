
TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    JOB.DATAVIS.PRESENTATION = toupper(JOB.DATAVIS.PRESENTATION)
  ) 



TEMP$JOB.DATAVIS.PRESENTATION <-  gsub(", ", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub(",", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub("; ", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub(";", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub(" ;", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub(" AND ", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub("/ ", ",", TEMP$JOB.DATAVIS.PRESENTATION )
TEMP$JOB.DATAVIS.PRESENTATION <-  gsub("/", ",", TEMP$JOB.DATAVIS.PRESENTATION )



TEMP <- TEMP %>% separate(JOB.DATAVIS.PRESENTATION, c("ONE",
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
      grepl("DASHBOARD", NAME) ~ "DASHBOARD",
      grepl("DOCUMENTS", NAME) ~ "DOCUMENTS & ARTICLES",
      grepl("STATIC", NAME) ~ "STATIC WEB PAGE",
      grepl("EMBED", NAME) ~ "EMBEDDED IN A TOOL",
      grepl("INTERACTIVE WEB", NAME) ~ "INTERACTIVE WEB PAGE",
      grepl("DYNAMIC W", NAME) ~ "INTERACTIVE WEB PAGE",
      grepl("WEB AP", NAME) ~ "INTERACTIVE WEB PAGE",
      grepl("PRINT", NAME) ~ "NEWSPAPER OR OTHER PHYSICAL HANDOUT",
      grepl("PAPER", NAME) ~ "NEWSPAPER OR OTHER PHYSICAL HANDOUT",
      grepl("POSTER", NAME) ~ "NEWSPAPER OR OTHER PHYSICAL HANDOUT",
      grepl("SOCIAL", NAME) ~ "SOCIAL MEDIA",
      grepl("TWITTER", NAME) ~ "SOCIAL MEDIA",
      grepl("FACEBOOK", NAME) ~ "SOCIAL MEDIA",
      grepl("INSTAGRAM", NAME) ~ "SOCIAL MEDIA",
      grepl("SLACK", NAME) ~ "SOCIAL MEDIA",
      grepl("INSTALLATION", NAME) ~ "PHYSICAL INSTALLATIONS",
      grepl("ARTICLES", NAME) ~ "DOCUMENTS & ARTICLES",
      grepl("BLOG", NAME) ~ "DOCUMENTS & ARTICLES",
      T ~ NAME
    )
  )



# 9669
# TEMP %>%
#   subset(NAME != "-") %>%
#   subset(!is.na(NAME)) %>% View()
# 


TEMP %>%
  subset(NAME != "-") %>%
  group_by(NAME) %>%
  summarise(count = n()) %>%
  mutate(
    percentage = 100*count/ 9669,
    percentage = round(percentage, digits = 2)
  ) %>% View()


###

filter <- TEMP %>% 
  subset(NAME != "-") %>% 
  subset(!is.na(NAME)) %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>% 
  mutate(
    percentage = 100*count/ 9669,
    percentage = round(percentage, digits = 2)
  ) %>% 
  subset(count > 3) 

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


DATAVIS.PRESENTATION <- TEMP

