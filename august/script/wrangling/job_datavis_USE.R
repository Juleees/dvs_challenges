# 
# TEMP <- ALL.YEARS
# 
# 
# TEMP <- TEMP %>% 
#   mutate(
#     JOB.DATAVIS.USE = toupper(JOB.DATAVIS.USE)
#   ) 
# 
# 
# 
# # TEMP$JOB.DATAVIS.USE <-  gsub(", ", ",", TEMP$JOB.DATAVIS.USE )
# # TEMP$JOB.DATAVIS.USE <-  gsub(",", ",", TEMP$JOB.DATAVIS.USE )
# # TEMP$JOB.DATAVIS.USE <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.USE )
# 
# TEMP$JOB.DATAVIS.USE <-  gsub("S, ", ";", TEMP$JOB.DATAVIS.USE )
# TEMP$JOB.DATAVIS.USE <-  gsub("), ", ");", TEMP$JOB.DATAVIS.USE )
# TEMP$JOB.DATAVIS.USE <-  gsub("; ", ",;", TEMP$JOB.DATAVIS.USE )
# TEMP$JOB.DATAVIS.USE <-  gsub(";", ";", TEMP$JOB.DATAVIS.USE )
# TEMP$JOB.DATAVIS.USE <-  gsub(" ;", ";", TEMP$JOB.DATAVIS.USE )
# 
# 
# 
# TEMP <- TEMP %>% separate(JOB.DATAVIS.USE, c("ONE",
#                                                "TWO",
#                                                "THREE",
#                                                "FOUR",
#                                                "FIVE",
#                                                "SIX",
#                                                "SEVEN",
#                                                "EIGHT",
#                                                "NINE",
#                                                "TEN",
#                                                "ELEVEN",
#                                                "TWELVE",
#                                                "THIRTEEN",
#                                                "FOURTEEN",
#                                                "FIFTEEN",
#                                                "SIXTEEN",
#                                                "SEVENTEEN",
#                                                "EIGHTEEN",
#                                                "NINETEEN",
#                                                "TWENTY", 
#                                                "TWENTYONE",
#                                                "TWENTYTWO",
#                                                "TWENTYTHREE",
#                                                "TWENTYFOUR",
#                                                "TWENTYFIVE",
#                                                "TWENTYSIX"), ";") %>% 
#   select(YEAR,
#          REGION,
#          ONE,
#          TWO,
#          THREE,
#          FOUR,
#          FIVE,
#          SIX,
#          SEVEN,
#          EIGHT,
#          NINE,
#          TEN,
#          ELEVEN,
#          TWELVE,
#          THIRTEEN,
#          FOURTEEN,
#          FIFTEEN,
#          SIXTEEN,
#          SEVENTEEN,
#          EIGHTEEN,
#          NINETEEN,
#          TWENTY,
#          TWENTYONE,
#          TWENTYTWO,
#          TWENTYTHREE,
#          TWENTYFOUR,
#          TWENTYFIVE,
#          TWENTYSIX
#   )
# 
# 
# TEMP <- gather(TEMP,VALUE,NAME, -YEAR, -REGION) %>% 
#   select(YEAR, REGION, NAME)
# 
# 
# 
# 
# TEMP <- TEMP %>% 
#   mutate(
#     NAME = case_when(
#       grepl("BUSINESS INT", NAME) ~ "BUSINESS INTELLIGENCE",
#       grepl("CUSTOM", NAME) ~ "COMPLETELY CUSTOM",
#       grepl("PEN", NAME) ~ "PEN & PAPER OR OTHER PHYSICAL OBJECTS",
#       T ~ NAME
#     )
#   )
# 
# 
# 
# 
# 
# TEMP %>%
#   subset(NAME != "-") %>%
#   subset(!is.na(NAME)) %>% View()
# 
# 
# 
# TEMP %>%
#   subset(NAME != "-") %>%
#   group_by(NAME) %>%
#   summarise(count = n()) %>%
#   mutate(
#     percentage = 100*count/ 6280,
#     percentage = round(percentage, digits = 2)
#   ) %>% View()
# 
