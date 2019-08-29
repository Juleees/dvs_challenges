TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    EDU.MAJOR = toupper(EDU.MAJOR)
  ) 



TEMP <- TEMP %>% 
  mutate(
    EDU.MAJOR = case_when(
      # EDU.MAJOR %in% c("MATH",
      #                  "MATHEMATICS", 
      #                  "STATISTICS") ~ "MATH & STATISTICS",
      # EDU.MAJOR %in% c("BACHELORS",
      #                       "BACHELOR OF FINE ARTS",
      #                       "CURRENTLY UNIVERSITY STUDENT",
      #                       "AAS/WORK TOWARD BA.",
      #                       "MATHS GRADUATE",
      #                       "ED.D") ~ "BACHELORS",
      # EDU.MAJOR %in% c("ENGINEERING",,
      #                  "MECHANICAL ENGINEERING",
      #                  "ELECTRICAL ENGINEERING",
      #                  "CHEMICAL ENGINEERING",
      #                  "COMPUTER ENGINEERING",
      #                  "INDUSTRIAL ENGINEERING",
      #                  "CIVIL ENGINEERING",
      #                  "AEROSPACE ENGINEERING") ~ "ENGINEERING",
      # EDU.MAJOR %in% c("MASTERS",
      #                       "FINSIHING MASTERS",
      #                       "IN SCHOOL FOR MY MASTERS NOW",
      #                       "MASTERS & ABD",
      #                       "MLIS, MASTER OF LIBRARY AND INFORMATION SCIENCE",
      #                       "PURSUING A MASTERS") ~ "MASTERS",
      # EDU.MAJOR %in% c("POST GRADUATE",
      #                       "POST GRAD CERTIFICATE.",
      #                       "POST GRAD DIPLOMA (NOT MASTERS)",
      #                       "POST GRADUATE DIPLOMA",
      #                       "GRADUATE LEVEL") ~ "POST GRADUATE",
      # EDU.MAJOR %in% c("ASSOCIATES",
      #                       "ASSOCIATES OF SCIENCE",
      #                       "2 YEARS UNDERGRAD",
      #                       "MODERN APPRENTICESHIP IN CREATIVE DIGITAL MEDIA") ~ "ASSOCIATE",
      # EDU.MAJOR %in% c("HIGH SCHOOL",
      #                       "HIGH SCHOOL, AND A FEW COLLEGE CLASSES",
      #                       "HIGH SCHOOL, SOME COLLEGE (NO DEGREE)",
      #                       "JUST HIGH-SCHOOL AND LIFE-LONG-LEARNING") ~ "HIGH SCHOOL",
      # EDU.MAJOR %in% c("AUTODIDACT",
      #                       "NONE",
      #                       "NONE? MIGHT WANT TO ADJUST THIS QUESTION.",
      #                       "SCHOOL",
      #                       "SELF TAUGHT",
      #                       "WORK/ON THE JOB",
      #                       "SCHOOL",
      #                       "DROPOUT",
      #                       "DIPLOMA",
      #                       "HIGHER EDUCATION NONE DEGREE",
      #                       "HONORS DEGREE",
      #                       "CULINARY ARTS SCHOOL",
      #                       "MD",
      #                       "I DROPPED OUT OF SCHOOL IN GRADE 9. YES, REALLY.",
      #                       "NO DEGREE") ~ "OTHER",
      grepl("COMPUTER SCIENCE", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("SOFTWARE", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      grepl("COMPU", EDU.MAJOR) ~ "COMPUTER SCIENCE",
      
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
      T ~ EDU.MAJOR
    )
  ) 

ANALYTICS


TEMP %>% 
  group_by(EDU.MAJOR) %>% 
  summarise(count = n()) %>% View()

ALL.YEARS <- TEMP