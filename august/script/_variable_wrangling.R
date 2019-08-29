# Variable Wrangling:
# Analysis and Cleaning by Variable
JIC <- ALL.YEARS

str(ALL.YEARS)

# YEAR
## READY!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    YEAR = as.character(YEAR)
  )
summary(ALL.YEARS$YEAR)


#  COMMUNITY.EXPECTATION 
## THIS ANSWER IS TYPED IN MEANING THAT I SHOULD SEARCH PATTERNS IN THE TEXT  
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    COMMUNITY.EXPECTATION = as.character(COMMUNITY.EXPECTATION)
  )

#  COMMUNITY.LEADERS 
# I should separate the names in commas, that way its easier to count the times someone is mentioned
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    COMMUNITY.LEADERS = as.character(COMMUNITY.LEADERS),
    COMMUNITY.LEADERS = as.factor(COMMUNITY.LEADERS)
    
  )
summary(ALL.YEARS$COMMUNITY.LEADERS)

source(here::here("script", "wrangling", "community_leaders.R"))

#  COUNTRY 
## READY
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    COUNTRY = as.character(COUNTRY),
    COUNTRY = as.factor(COUNTRY)
    
  )

ALL.YEARS %>% group_by(COUNTRY, YEAR) %>% 
  summarise(count = n()) %>% View()


source(here::here("script", "wrangling", "country.R"))

# 2017 has no country data, only "Regions" should I made it more   
# 2018 has state data, which messes the data for the US
# 2019 has mostly good data but some "countries" are vague aka Europe



#  DATAVIS.EDU 
# READY
# Remeber to filter the NA when plotting!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    DATAVIS.EDU = as.character(DATAVIS.EDU),
    DATAVIS.EDU = as.factor(DATAVIS.EDU)
    
  )

summary(ALL.YEARS$DATAVIS.EDU)

ALL.YEARS %>% group_by(DATAVIS.EDU, YEAR) %>% 
  summarise(count = n()) %>% View()




#  DATAVIS.EDU.METHOD 
# I should separate the names in commas, that way its easier to count the times a method is mentioned
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    DATAVIS.EDU.METHOD = as.character(DATAVIS.EDU.METHOD),
    DATAVIS.EDU.METHOD = as.factor(DATAVIS.EDU.METHOD)
    
  )

summary(ALL.YEARS$DATAVIS.EDU.METHOD)

source(here::here("script", "wrangling", "dataviz_edu_methods.R"))

#  DATAVIS.TIME 
# READY
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    DATAVIS.TIME = as.character(DATAVIS.TIME),
    DATAVIS.TIME = as.factor(DATAVIS.TIME)
    
  )

summary(ALL.YEARS$DATAVIS.TIME)


#  EDU.BACKGROUND 
# Needs cleaning the 2019 data to fit the other year mold
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    EDU.BACKGROUND = as.character(EDU.BACKGROUND),
    EDU.BACKGROUND = as.factor(EDU.BACKGROUND)
    
  )

summary(ALL.YEARS$EDU.BACKGROUND)

ALL.YEARS %>% group_by(EDU.BACKGROUND, YEAR) %>% 
  summarise(count = n()) %>% View()

source(here::here("script", "wrangling", "edu_background.R"))


#  EDU.MAJOR 
#  NEEDS INTENSE CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    EDU.MAJOR = as.character(EDU.MAJOR),
    EDU.MAJOR = toupper(EDU.MAJOR),
    EDU.MAJOR = as.factor(EDU.MAJOR)
    
  )

summary(ALL.YEARS$EDU.MAJOR)

ALL.YEARS %>% group_by(EDU.MAJOR, YEAR) %>% 
  summarise(count = n()) %>% View()

source(here::here("script", "wrangling", "edu_major.R"))


#  EXPERIENCE.DATAVIS.YEARS 
#  READY
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    EXPERIENCE.DATAVIS.YEARS = as.character(EXPERIENCE.DATAVIS.YEARS),
    EXPERIENCE.DATAVIS.YEARS = as.numeric(EXPERIENCE.DATAVIS.YEARS)
    
  )

summary(ALL.YEARS$EXPERIENCE.DATAVIS.YEARS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(EXPERIENCE.DATAVIS.YEARS) %>% 
  summary()



#  FREELANCE.OR.CONSULTANT
#  READY, ONLY PRESENT IN 2019
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    FREELANCE.OR.CONSULTANT = as.character(FREELANCE.OR.CONSULTANT),
    FREELANCE.OR.CONSULTANT = as.factor(FREELANCE.OR.CONSULTANT)
    
  )

summary(ALL.YEARS$FREELANCE.OR.CONSULTANT)


#  GENDER 
#  READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    GENDER = as.character(GENDER),
    GENDER = toupper(GENDER)
  ) %>% 
  mutate(
    GENDER = case_when(
      GENDER %in% c("FEMALE") ~ "WOMAN",
      GENDER %in% c("MALE") ~ "MAN",
      GENDER %in% c("NON BINARY", "WOMAN, NON-BINARY",
                    "GENDERQUEER", "MAN, NON-BINARY",
                    "NON-BINARY") ~ "NON BINARY",
      GENDER %in% c("PREFER NOT TO SAY", 
                    "WOMAN, PREFER NOT TO SAY") ~ "PREFER NOT TO SAY",
      T ~ GENDER
    ),
    GENDER = as.factor(GENDER)
    )

summary(ALL.YEARS$GENDER)


##################################################################################### YOU ARE HERE

#  JOB.DATASCI.HOURS 
#  DECIDE IF USE ALL YEARS OR JUST 2019 SINCE THE MEASUREMENTS ARE DIFFERENT
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATASCI.HOURS = as.character(JOB.DATASCI.HOURS),
    JOB.DATASCI.HOURS = as.numeric(JOB.DATASCI.HOURS)
    
  )

summary(ALL.YEARS$JOB.DATASCI.HOURS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(JOB.DATASCI.HOURS) %>% 
  summary()



#  JOB.DATAVIS.ASPIRATION 
#  LOAD OF INPUTTED TEXT, DONT KNOW WHAT TO DO WITH IT
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.ASPIRATION = as.character(JOB.DATAVIS.ASPIRATION),
    JOB.DATAVIS.ASPIRATION = as.factor(JOB.DATAVIS.ASPIRATION)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.ASPIRATION)

ALL.YEARS %>% group_by(JOB.DATAVIS.ASPIRATION, YEAR) %>% 
  summarise(count = n()) %>% View()


#  JOB.DATAVIS.AUDIENCE 
# I should separate the names in commas, that way its easier to count the times an AUDIENCE is mentioned
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.AUDIENCE = as.character(JOB.DATAVIS.AUDIENCE)
    
  )

source(here::here("script", "wrangling", "jod_datavis_audience.R"))


#  JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION 
#  READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION = as.character(JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION),
    JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION = as.factor(JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION)
ALL.YEARS %>% group_by(JOB.DATAVIS.AUDIENCEDATAVISCONSUMPTION, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.AUDIENCEDATAVISUSE 
# I should separate the names in commas, that way its easier to count the times an USE is mentioned
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.AUDIENCEDATAVISUSE = as.character(JOB.DATAVIS.AUDIENCEDATAVISUSE),
    JOB.DATAVIS.AUDIENCEDATAVISUSE = toupper(JOB.DATAVIS.AUDIENCEDATAVISUSE),
    JOB.DATAVIS.AUDIENCEDATAVISUSE = as.factor(JOB.DATAVIS.AUDIENCEDATAVISUSE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.AUDIENCEDATAVISUSE)
ALL.YEARS %>% group_by(JOB.DATAVIS.AUDIENCEDATAVISUSE) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.AUDIENCEKNOWLEGE 
# With this one im not so sure, if we should separate it, the mix is what makes it interesting.
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.AUDIENCEKNOWLEGE = as.character(JOB.DATAVIS.AUDIENCEKNOWLEGE),
    JOB.DATAVIS.AUDIENCEKNOWLEGE = toupper(JOB.DATAVIS.AUDIENCEKNOWLEGE),
    JOB.DATAVIS.AUDIENCEKNOWLEGE = as.factor(JOB.DATAVIS.AUDIENCEKNOWLEGE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.AUDIENCEKNOWLEGE)
ALL.YEARS %>% group_by(JOB.DATAVIS.AUDIENCEKNOWLEGE, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.AUDIENCERELATIONSHIP
#  READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.AUDIENCERELATIONSHIP = as.character(JOB.DATAVIS.AUDIENCERELATIONSHIP),
    JOB.DATAVIS.AUDIENCERELATIONSHIP = toupper(JOB.DATAVIS.AUDIENCERELATIONSHIP),
    JOB.DATAVIS.AUDIENCERELATIONSHIP = as.factor(JOB.DATAVIS.AUDIENCERELATIONSHIP)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.AUDIENCERELATIONSHIP)
ALL.YEARS %>% group_by(JOB.DATAVIS.AUDIENCERELATIONSHIP, YEAR) %>% 
  summarise(count = n()) %>% View()


#  JOB.DATAVIS.CHANGE 
# This one is pure text! D:
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.CHANGE = as.character(JOB.DATAVIS.CHANGE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.CHANGE)
ALL.YEARS %>% group_by(JOB.DATAVIS.CHANGE, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.CHARTSUSED 
# I should separate the names in commas, that way its easier to count the times a GRAPH is mentioned
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.CHARTSUSED = as.character(JOB.DATAVIS.CHARTSUSED)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.CHARTSUSED)
ALL.YEARS %>% group_by(JOB.DATAVIS.CHARTSUSED, YEAR) %>% 
  summarise(count = n()) %>% View()


#  JOB.DATAVIS.EXPECTATIONS 
#  READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.EXPECTATIONS = as.character(JOB.DATAVIS.EXPECTATIONS),
    JOB.DATAVIS.EXPECTATIONS = toupper(JOB.DATAVIS.EXPECTATIONS),
    JOB.DATAVIS.EXPECTATIONS = as.factor(JOB.DATAVIS.EXPECTATIONS)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.EXPECTATIONS)
ALL.YEARS %>% group_by(JOB.DATAVIS.EXPECTATIONS, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.FATIGUE 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.FATIGUE = as.character(JOB.DATAVIS.FATIGUE),
    JOB.DATAVIS.FATIGUE = as.numeric(JOB.DATAVIS.FATIGUE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.FATIGUE)



#  JOB.DATAVIS.FOCUS 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.FOCUS = as.character(JOB.DATAVIS.FOCUS),
    JOB.DATAVIS.FOCUS = toupper(JOB.DATAVIS.FOCUS),
    JOB.DATAVIS.FOCUS = as.factor(JOB.DATAVIS.FOCUS)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.FOCUS)
ALL.YEARS %>% group_by(JOB.DATAVIS.FOCUS, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.FRUSTRATION 
## Pure text!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.FRUSTRATION = as.character(JOB.DATAVIS.FRUSTRATION)
  )

summary(ALL.YEARS$JOB.DATAVIS.FRUSTRATION)



#  JOB.DATAVIS.GOALS 
# I should separate the names in commas, that way its easier to count the times a GOAL is mentioned
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.FRUSTRATION = as.character(JOB.DATAVIS.FRUSTRATION)
  )

summary(ALL.YEARS$JOB.DATAVIS.FRUSTRATION)


#  JOB.DATAVIS.HOURS 
# Same issue as the hours from before
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATASCI.HOURS = as.character(JOB.DATAVIS.HOURS),
    JOB.DATASCI.HOURS = as.numeric(JOB.DATAVIS.HOURS)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.HOURS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(JOB.DATASCI.HOURS) %>% 
  summary()


#  JOB.DATAVIS.INTENT 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.INTENT = as.character(JOB.DATAVIS.INTENT),
    JOB.DATAVIS.INTENT = toupper(JOB.DATAVIS.INTENT),
    JOB.DATAVIS.INTENT = as.factor(JOB.DATAVIS.INTENT)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.INTENT)
ALL.YEARS %>% group_by(JOB.DATAVIS.INTENT, YEAR) %>% 
  summarise(count = n()) %>% View()


#  JOB.DATAVIS.LACKSKILLS 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.LACKSKILLS = as.character(JOB.DATAVIS.LACKSKILLS),
    JOB.DATAVIS.LACKSKILLS = as.numeric(JOB.DATAVIS.LACKSKILLS)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.LACKSKILLS)


#  JOB.DATAVIS.LEADERSHIP 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.LEADERSHIP = as.character(JOB.DATAVIS.LEADERSHIP),
    JOB.DATAVIS.LEADERSHIP = toupper(JOB.DATAVIS.LEADERSHIP),
    JOB.DATAVIS.LEADERSHIP = as.factor(JOB.DATAVIS.LEADERSHIP)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.LEADERSHIP)
ALL.YEARS %>% group_by(JOB.DATAVIS.LEADERSHIP, YEAR) %>% 
  summarise(count = n()) %>% View()


#  JOB.DATAVIS.LEADERSHIP.UNDERSTANDING 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.LEADERSHIP.UNDERSTANDING = as.character(JOB.DATAVIS.LEADERSHIP.UNDERSTANDING),
    JOB.DATAVIS.LEADERSHIP.UNDERSTANDING = as.numeric(JOB.DATAVIS.LEADERSHIP.UNDERSTANDING)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.LEADERSHIP.UNDERSTANDING)


#  JOB.DATAVIS.NEWTOOLS 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.NEWTOOLS = as.character(JOB.DATAVIS.NEWTOOLS),
    JOB.DATAVIS.NEWTOOLS = as.numeric(JOB.DATAVIS.NEWTOOLS)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.NEWTOOLS)


#  JOB.DATAVIS.ORGANIZATION 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.ORGANIZATION = as.character(JOB.DATAVIS.ORGANIZATION),
    JOB.DATAVIS.ORGANIZATION = toupper(JOB.DATAVIS.ORGANIZATION),
    JOB.DATAVIS.ORGANIZATION = as.factor(JOB.DATAVIS.ORGANIZATION)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.ORGANIZATION)
ALL.YEARS %>% group_by(JOB.DATAVIS.ORGANIZATION, YEAR) %>% 
  summarise(count = n()) %>% View()


#  JOB.DATAVIS.PERSONALKNOWLEDGE 
## NEEDS CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.PERSONALKNOWLEDGE = as.character(JOB.DATAVIS.PERSONALKNOWLEDGE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.PERSONALKNOWLEDGE)



#  JOB.DATAVIS.PRESENTATION 
## NEEDS CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.PRESENTATION = as.character(JOB.DATAVIS.PRESENTATION)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.PRESENTATION)


#  JOB.DATAVIS.REACH 
## NEEDS CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.REACH = as.character(JOB.DATAVIS.REACH)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.REACH)



#  JOB.DATAVIS.RESOURCES 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.RESOURCES = as.character(JOB.DATAVIS.RESOURCES),
    JOB.DATAVIS.RESOURCES = as.numeric(JOB.DATAVIS.RESOURCES)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.RESOURCES)



#  JOB.DATAVIS.TOOLCHOICE 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.TOOLCHOICE = as.character(JOB.DATAVIS.TOOLCHOICE),
    JOB.DATAVIS.TOOLCHOICE = toupper(JOB.DATAVIS.TOOLCHOICE),
    JOB.DATAVIS.TOOLCHOICE = as.factor(JOB.DATAVIS.TOOLCHOICE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.TOOLCHOICE)
ALL.YEARS %>% group_by(JOB.DATAVIS.TOOLCHOICE, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DATAVIS.TOOLS
## NEEDS CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.TOOLS = as.character(JOB.DATAVIS.TOOLS)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.TOOLS)



#  JOB.DATAVIS.USE 
## NEEDS CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DATAVIS.USE = as.character(JOB.DATAVIS.USE)
    
  )

summary(ALL.YEARS$JOB.DATAVIS.USE)



#  JOB.DESCRIPTION 
## READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DESCRIPTION = as.character(JOB.DESCRIPTION),
    JOB.DESCRIPTION = toupper(JOB.DESCRIPTION),
    JOB.DESCRIPTION = as.factor(JOB.DESCRIPTION)
    
  )

summary(ALL.YEARS$JOB.DESCRIPTION)
ALL.YEARS %>% group_by(JOB.DESCRIPTION, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.DESIGN.HOURS 
## MIGHT BE GOOD TO FILTER AND ONLY USE 2019
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.DESIGN.HOURS = as.character(JOB.DESIGN.HOURS),
    JOB.DESIGN.HOURS = as.numeric(JOB.DESIGN.HOURS)
    
  )

summary(ALL.YEARS$JOB.DESIGN.HOURS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(JOB.DESIGN.HOURS) %>% 
  summary()



#  JOB.ENGINEERING.HOURS 
## MIGHT BE GOOD TO FILTER AND ONLY USE 2019
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.ENGINEERING.HOURS = as.character(JOB.ENGINEERING.HOURS),
    JOB.ENGINEERING.HOURS = as.numeric(JOB.ENGINEERING.HOURS)
    
  )

summary(ALL.YEARS$JOB.ENGINEERING.HOURS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(JOB.ENGINEERING.HOURS) %>% 
  summary()



#  JOB.IMPROVEMENT 
## PURE TEXT, NEEDS CLEANING
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.IMPROVEMENT = as.character(JOB.IMPROVEMENT)
    
  )

summary(ALL.YEARS$JOB.IMPROVEMENT)



#  JOB.PAY
# READY!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.PAY = as.character(JOB.PAY),
    JOB.PAY = as.factor(JOB.PAY)
    
  )

summary(ALL.YEARS$JOB.PAY)
ALL.YEARS %>% group_by(JOB.PAY, YEAR) %>% 
  summarise(count = n()) %>% View()



#  JOB.PORTFOLIO.HOURS
## MIGHT BE GOOD TO FILTER AND ONLY USE 2019
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.PORTFOLIO.HOURS = as.character(JOB.PORTFOLIO.HOURS),
    JOB.PORTFOLIO.HOURS = as.numeric(JOB.PORTFOLIO.HOURS)
    
  )

summary(ALL.YEARS$JOB.PORTFOLIO.HOURS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(JOB.DATASCI.HOURS) %>% 
  summary()


#  JOB.PREPWORK.HOURS 
## MIGHT BE GOOD TO FILTER AND ONLY USE 2019
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.PREPWORK.HOURS = as.character(JOB.PREPWORK.HOURS),
    JOB.PREPWORK.HOURS = as.numeric(JOB.PREPWORK.HOURS)
    
  )

summary(ALL.YEARS$JOB.PREPWORK.HOURS)

ALL.YEARS %>% subset(YEAR == "2019") %>% 
  select(JOB.PREPWORK.HOURS) %>% 
  summary()


#  JOB.SECTOR 
## NEEDS CLEANING!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    JOB.SECTOR = as.character(JOB.SECTOR),
    JOB.SECTOR = as.factor(JOB.SECTOR)
    
  )

summary(ALL.YEARS$JOB.SECTOR)
ALL.YEARS %>% group_by(JOB.SECTOR, YEAR) %>% 
  summarise(count = n()) %>% View()


#  LGBTQ 
##  READY!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    LGBTQ = as.character(LGBTQ),
    LGBTQ = as.factor(LGBTQ)
    
  )

summary(ALL.YEARS$LGBTQ)
ALL.YEARS %>% group_by(LGBTQ, YEAR) %>% 
  summarise(count = n()) %>% View()


#  SPEAK.LANGUAGE
# NEEDS MORE CLEANING!!
ALL.YEARS <- ALL.YEARS %>% 
  mutate(
    SPOKEN.LANGUAGE = as.character(SPOKEN.LANGUAGE),
    SPOKEN.LANGUAGE = as.factor(SPOKEN.LANGUAGE)
    
  )

summary(ALL.YEARS$SPOKEN.LANGUAGE)
ALL.YEARS %>% group_by(SPOKEN.LANGUAGE, YEAR) %>% 
  summarise(count = n()) %>% View()
