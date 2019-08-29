TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    EDU.MAJOR = toupper(EDU.MAJOR)
  ) 



TEMP <- TEMP %>% 
  mutate(
    EDU.MAJOR = case_when(
      grepl("COMPUTER SCIENCE", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("SOFTWARE", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("COMPU", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("PROGRAMMING", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("PROGRAMMING", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("PROGRAMMING", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      
      grepl("ENGINEERING", EDU.MAJOR) ~ "ENGINEERING",
      grepl("ENGINEER", EDU.MAJOR) ~ "ENGINEERING",
      grepl("ACCOUNTING", EDU.MAJOR) ~ "ACCOUNTING",
      grepl("ACCOUNTANCY", EDU.MAJOR) ~ "ACCOUNTING",
      grepl("DESIGN", EDU.MAJOR) ~ "DESIGN",
      grepl("DATA", EDU.MAJOR) ~ "DATA SCIENCE",
      grepl("ANALYTICS", EDU.MAJOR) ~ "DATA SCIENCE",
      grepl("ADVERTISING", EDU.MAJOR) ~ "MARKETING & ADVERTISING",
      grepl("MARKETING", EDU.MAJOR) ~ "MARKETING & ADVERTISING",
      grepl("MATH", EDU.MAJOR) ~ "MATH & STATISTICS",
      grepl("STATISTICS", EDU.MAJOR) ~ "MATH & STATISTICS",
      grepl("BUSINESS", EDU.MAJOR) ~ "BUSINESS & FINANCE",
      grepl("FINANCE", EDU.MAJOR) ~ "BUSINESS & FINANCE",
      
      grepl("ANTHROPOLOGY", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("ECONOMICS", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("GEOGRAPHY", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("HISTORY", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("POLITICAL", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("SOCIOLOGY", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("PSYCOLOGY", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("PSYCHOLOGY", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("SOCIAL SCIENCE", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("POLITICS", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("POL", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      grepl("HUMANITIES", EDU.MAJOR) ~ "SOCIAL SCIENCES",
      
      grepl("PHYSICS", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("ASTRO", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("CHEMISTRY", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("ACOUSTICS", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("EARTH", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("GEO", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("BIO", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("BOTANY", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("ENVIRONMENT", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("ATMOSPHERIC", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("ECOLOGY", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("LIFE", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("HYDROLOGY", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("ZOOLOGY", EDU.MAJOR) ~ "NATURAL SCIENCES",
      grepl("OCEAN", EDU.MAJOR) ~ "NATURAL SCIENCES",
      
      grepl("LITERATURE", EDU.MAJOR) ~ "LITERATURE",
      grepl("INTERNATIONAL", EDU.MAJOR) ~ "INTERNATIONAL STUDIES",
      grepl("PHILOSOPHY", EDU.MAJOR) ~ "PHILOSOPHY",
      grepl("JOURNALISM", EDU.MAJOR) ~ "JOURNALISM",
      grepl("MEDIA", EDU.MAJOR) ~ "JOURNALISM",
      
      
      grepl("MEDICINE", EDU.MAJOR) ~ "MEDICINE & HEALTH SCIENCES",
      grepl("HEALTH", EDU.MAJOR) ~ "MEDICINE & HEALTH SCIENCES",
      grepl("PHARMACY", EDU.MAJOR) ~ "MEDICINE & HEALTH SCIENCES",
      grepl("THEATER", EDU.MAJOR) ~ "THEATER",
      grepl("FILM", EDU.MAJOR) ~ "FILM",
      grepl("INFORMATION", EDU.MAJOR) ~ "INFORMATION SCIENCE",
      grepl("MUSIC", EDU.MAJOR) ~ "MUSIC",
      grepl("URBAN", EDU.MAJOR) ~ "URBAN STUDIES",
      grepl("ENGLISH", EDU.MAJOR) ~ "ENGLISH",
      grepl("CHINESE", EDU.MAJOR) ~ "CHINESE",
      grepl("FRENCH", EDU.MAJOR) ~ "FRENCH",
      grepl("LANGUAGES", EDU.MAJOR) ~ "LANGUAGES",
      grepl("POLICY", EDU.MAJOR) ~ "POLICY SCIENCE",
      grepl("BEHAVIO", EDU.MAJOR) ~ "BEHAVIOURAL SCIENCE",
      grepl("TELECOMMUNICATION", EDU.MAJOR) ~ "TELECOMMUNICATION",
      grepl("COMMUNICATION", EDU.MAJOR) ~ "COMMUNICATION",
      grepl("BIBLICAL", EDU.MAJOR) ~ "THEOLOGY",
      grepl("GENETICS", EDU.MAJOR) ~ "GENETICS",
      grepl("ART", EDU.MAJOR) ~ "ART",
      grepl("DRAWING", EDU.MAJOR) ~ "ART",
      grepl("ILLUSTRATION", EDU.MAJOR) ~ "ART",
      grepl("ARCHITECTURE", EDU.MAJOR) ~ "ART",
      grepl("LINGUI", EDU.MAJOR) ~ "LINGUISTICS",
      T ~ EDU.MAJOR
    )
  ) %>% 
  mutate(
    EDU.MAJOR = case_when(
      grepl("ART", EDU.MAJOR) ~ "THE ARTS",
      grepl("MUSIC", EDU.MAJOR) ~ "THE ARTS",
      grepl("LITERATURE", EDU.MAJOR) ~ "THE ARTS",
      grepl("THEAT", EDU.MAJOR) ~ "THE ARTS",
      grepl("PHOTOGRAPHY", EDU.MAJOR) ~ "THE ARTS",
      grepl("FILM", EDU.MAJOR) ~ "THE ARTS",
      grepl("PLAYWRIGHTING", EDU.MAJOR) ~ "THE ARTS",
      grepl("TEXTILES", EDU.MAJOR) ~ "THE ARTS",
      grepl("FILM", EDU.MAJOR) ~ "THE ARTS",
      EDU.MAJOR %in% c("ENGLISH",
                       "CHINESE",
                       "FRENCH",
                       "INTERPRETING",
                       "SPANISH") ~ "LANGUAGES",
      EDU.MAJOR %in% c("IT",
                       "INFORMATION SCIENCE",
                       "INFORMATICS",
                       "CONPUTER SCIENCES",
                       "CS") ~ "COMPUTER SCIENCE",
      EDU.MAJOR %in% c("FRONTEND DEVELOP",
                       "WEB DEVELOPMENT") ~ "DESIGN",
      EDU.MAJOR %in% c("ELECTRICAL AND ELECTRONICS",
                       "ELECTRONICS") ~ "ENGINEERING",
      EDU.MAJOR %in% c("MANAGEMENT",
                       "OPERATIONS MANAGEMENT",
                       "") ~ "BUSINESS & FINANCE",
      
      T ~ EDU.MAJOR
    )
  )


filter <- TEMP %>% 
  group_by(EDU.MAJOR) %>% 
  summarise(count = n()) %>% 
  subset(count > 10) 

names <- filter$EDU.MAJOR

TEMP <- TEMP %>% 
  mutate(
    EDU.MAJOR = case_when(
      EDU.MAJOR %nin% names ~ "OTHER",
      T ~ EDU.MAJOR
      )
)

TEMP %>% 
  group_by(EDU.MAJOR) %>% 
  summarise(count = n()) %>% View()

ALL.YEARS <- TEMP






# library(xlsx)
# jj <- read.xlsx("Texas_Update.xlsx", sheetName = "Hoja1")
# write_csv(jj,"Texas_Update.csv")
