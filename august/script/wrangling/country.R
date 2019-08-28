

TEMP <- ALL.YEARS

source(here::here("script", "wrangling", "country_list.R"))

categories <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vSBalf6PgqCpEmF8FZa2nTpUoZJ4MeMpbkeBHKNKz2S1hGk7c28sFiU8utsIXi3Dg/pub?gid=2018254079&single=true&output=csv"
) %>% select(c(Economy, `Income group`, Region))

summary(TEMP$COUNTRY)

# CREATE REGION VARIABLE
TEMP$REGION <- TEMP$COUNTRY

# ELIMINATE 2018 REGIONS FROM COUNTRIES
TEMP <- TEMP %>% 
  mutate(
    COUNTRY = toupper(COUNTRY)
  ) %>% 
  mutate(
    COUNTRY = case_when(
      COUNTRY %in% us.states ~ "UNITED STATES",
      COUNTRY %in% c("US", "USA", "WASHINGTON, DC") ~ "UNITED STATES",
      COUNTRY %in% c("UK", "NORTHERN IRELAND",
                     "SCOTLAND", "ENGLAND") ~ "UNITED KINGDOM",
      COUNTRY %in% c("NOVA SCOTIA", "ALBERTA", 
                     "SCOTLAND", "BRITISH COLUMBIA") ~ "CANADA",
      COUNTRY %in% c("MÉXICO") ~ "MEXICO",
      T ~ COUNTRY
    )
  ) 


# TEMP %>% group_by(COUNTRY) %>%
#   summarise(COUNT = n()) %>% View()

TEMP <- TEMP %>% 
  mutate(
    REGION = COUNTRY
  ) %>% 
  mutate(
    COUNTRY = if_else(YEAR == "2017", "_", COUNTRY)
  ) 

TEMP <- TEMP %>% 
  mutate(
    REGION = case_when(
      REGION %in% LAM.states ~ "LATIN AMERICA",
      REGION %in% EU.states ~ "EUROPE",
      REGION %in% c("UNITED STATES", "CANADA", "USA OR CANADA") ~ "US / CANADA",
      REGION %in% OC.states ~ "OCEANIA",
      REGION %in% AS.states ~ "ASIA",
      REGION %in% MENA.states ~ "MIDDLE EAST & AFRICA",
      T ~ REGION
    )
  ) 
  
ALL.YEARS <- TEMP

# TEMP %>% group_by(REGION, YEAR) %>% 
#   summarise(COUNT = n()) %>% View()


rm(OC.states, MENA.states, LAM.states, EU.states, us.states)
rm(categories, temp, TEMP)
