
TEMP <- ALL.YEARS

TEMP <- TEMP %>% 
  mutate(
    JOB.SECTOR = as.character(JOB.SECTOR),
    JOB.SECTOR = case_when(
      grepl("FREE", JOB.SECTOR) ~ "FREELANCE",
      grepl("CONSU", JOB.SECTOR) ~ "CONSULTING",
      grepl("AGENCY", JOB.SECTOR) ~ "CONSULTING",
      grepl("PUBLIC", JOB.SECTOR) ~ "PUBLIC SECTOR",
      grepl("MEDIA", JOB.SECTOR) ~ "JOURNALISM",
      grepl("US NATIONAL LAB", JOB.SECTOR) ~ "PUBLIC SECTOR",
      grepl("GOV", JOB.SECTOR) ~ "PUBLIC SECTOR",
      grepl("FEDERAL", JOB.SECTOR) ~ "PUBLIC SECTOR",
      grepl("DEFENCE", JOB.SECTOR) ~ "PUBLIC SECTOR",
      JOB.SECTOR %in% c("RETAIL", "BANKING",
                        "BUSINESS", "FINANCE", "FINANCIAL",
                        "FINTECH", "PRIVATE FOUNDATION",
                        "STARTUP", "PRIVATE") ~ "PRIVATE SECTOR",
      grepl("ALL", JOB.SECTOR) ~ "MIXED",
      grepl("BOTH", JOB.SECTOR) ~ "MIXED",
      grepl("MIX", JOB.SECTOR) ~ "MIXED",
      JOB.SECTOR %in% c("ACADEMIC + JOURNALISM",
                        "PRIVATE SECTOR AND ACADEMIC",
                        "VARIOUS") ~ "MIXED",
      grepl(",", JOB.SECTOR) ~ "MIXED",
      T ~ JOB.SECTOR
    )
  )

TEMP %>% group_by(JOB.SECTOR, YEAR) %>% 
  summarise(count = n()) %>% View()


names <-  c("FREELANCE", "CONSULTING", 
            "ACADEMIC", "MEDIA", "JOURNALISM", "PRIVATE SECTOR",
            "PUBLIC SECTOR", "NOT-FOR-PROFIT", "MIXED", NA)

TEMP <- TEMP %>% 
  mutate(
    JOB.SECTOR = case_when(
      JOB.SECTOR %nin% names ~ "OTHER",
      T ~ JOB.SECTOR
    )
  )

ALL.YEARS <- TEMP
