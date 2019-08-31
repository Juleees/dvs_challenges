# 
# TEMP <- ALL.YEARS
# 
# 
# TEMP <- TEMP %>% 
#   mutate(
#     JOB.DATAVIS.TOOLS = toupper(JOB.DATAVIS.TOOLS)
#   ) 
# 
# 
# 
# # TEMP$JOB.DATAVIS.TOOLS <-  gsub(", ", ",", TEMP$JOB.DATAVIS.TOOLS )
# # TEMP$JOB.DATAVIS.TOOLS <-  gsub(",", ",", TEMP$JOB.DATAVIS.TOOLS )
# # TEMP$JOB.DATAVIS.TOOLS <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.TOOLS )
# # TEMP$JOB.DATAVIS.TOOLS <-  gsub("; ", ",", TEMP$JOB.DATAVIS.TOOLS )
# TEMP$JOB.DATAVIS.TOOLS <-  gsub(";", ";", TEMP$JOB.DATAVIS.TOOLS )
# TEMP$JOB.DATAVIS.TOOLS <-  gsub(" ;", ";", TEMP$JOB.DATAVIS.TOOLS )
# # TEMP$JOB.DATAVIS.TOOLS <-  gsub(" AND ", ";", TEMP$JOB.DATAVIS.TOOLS )
# TEMP$JOB.DATAVIS.TOOLS <-  gsub("/ ", ";", TEMP$JOB.DATAVIS.TOOLS )
# TEMP$JOB.DATAVIS.TOOLS <-  gsub("/", ";", TEMP$JOB.DATAVIS.TOOLS )
# 
# 
# 
# TEMP <- TEMP %>% separate(JOB.DATAVIS.TOOLS, c("ONE",
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
# 
# TEMP <- TEMP %>% 
#   mutate(
#     NAME = case_when(
#       NAME %in% c("R") ~ "R + LIBRARIES",
#       grepl("OTHER R", NAME) ~ "R + LIBRARIES",
#       grepl("SHINY", NAME) ~ "R + LIBRARIES",
#       grepl("PYTHON", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("ALTAIR", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("PANDAS", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("MATPLOTLIB", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("BOKEH", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("VEGA", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("SEABORN", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("GGPLOT", NAME) ~ "PYTHON + LIBRARIES",
#       grepl("JAVASCRIPT", NAME) ~ "JAVASCRIPT + LIBRARIES",
#       grepl("HIGHCHARTS", NAME) ~ "JAVASCRIPT + LIBRARIES",
#       grepl("GIS", NAME) ~ "GIS",
#       grepl("ADOBE", NAME) ~ "ADOBE (AI, PS, AE, XD)",
#       grepl("PHOTOSHOP", NAME) ~ "ADOBE (AI, PS, AE, XD)",
#       grepl("ILLUSTRATOR", NAME) ~ "ADOBE (AI, PS, AE, XD)",
#       grepl("AFTER", NAME) ~ "ADOBE (AI, PS, AE, XD)",
#       grepl("JS", NAME) ~ "JAVASCRIPT + LIBRARIES",
#       grepl("BI", NAME) ~ "BI",
#       T ~ NAME
#     )
#   )
# 
# 
# # 
# # TEMP <- TEMP %>% 
# #   mutate(
# #     NAME = case_when(
# #       NAME %in% c("R") ~ "R + LIBRARIES",
# #       grepl("OTHER R", NAME) ~ "R + LIBRARIES",
# #       grepl("SHINY", NAME) ~ "R + LIBRARIES",
# #       grepl("PYTHON", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("ALTAIR", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("PANDAS", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("MATPLOTLIB", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("BOKEH", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("VEGA", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("SEABORN", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("GGPLOT", NAME) ~ "PYTHON + LIBRARIES",
# #       grepl("JAVASCRIPT", NAME) ~ "JAVASCRIPT + LIBRARIES",
# #       grepl("HIGHCHARTS", NAME) ~ "JAVASCRIPT + LIBRARIES",
# #       grepl("GIS", NAME) ~ "GIS",
# #       grepl("ADOBE", NAME) ~ "ADOBE (AI, PS, AE, XD)",
# #       grepl("PHOTOSHOP", NAME) ~ "ADOBE (AI, PS, AE, XD)",
# #       grepl("ILLUSTRATOR", NAME) ~ "ADOBE (AI, PS, AE, XD)",
# #       grepl("AFTER", NAME) ~ "ADOBE (AI, PS, AE, XD)",
# #       grepl("JS", NAME) ~ "JAVASCRIPT + LIBRARIES",
# #       grepl("BI", NAME) ~ "BI",
# #       T ~ NAME
# #     )
# #   )
# 
# 4018 
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
#     percentage = 100*count/ 4018,
#     percentage = round(percentage, digits = 2)
#   ) %>% View()
# 
# 
# ###
# 
# filter <- TEMP %>% 
#   subset(NAME != "-") %>% 
#   subset(!is.na(NAME)) %>% 
#   group_by(NAME) %>% 
#   summarise(count = n()) %>% 
#   mutate(
#     percentage = 100*count/ 3791,
#     percentage = round(percentage, digits = 2)
#   ) %>% 
#   subset(count >= 5) 
# 
# sum(filter$percentage)
# names <- filter$NAME
# 
# 
# TEMP <- TEMP %>% 
#   subset(NAME != "-") %>% 
#   subset(!is.na(NAME)) %>% 
#   mutate(
#     NAME = case_when(
#       NAME %nin% names ~ "OTHER",
#       T ~ NAME
#     )
#   )
# 
# 
# 
# TEMP %>% 
#   group_by(NAME) %>% 
#   summarise(count = n()) %>%  View()
# 
# 
# DATAVIS.REACH <- TEMP
