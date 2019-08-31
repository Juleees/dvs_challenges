TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    JOB.DATAVIS.CHARTSUSED = toupper(JOB.DATAVIS.CHARTSUSED)
  ) 



TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub(", ", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub(",", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub(" ,", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub("; ", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub(";", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub(" ;", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub(" AND ", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub("/ ", ",", TEMP$JOB.DATAVIS.CHARTSUSED )
TEMP$JOB.DATAVIS.CHARTSUSED <-  gsub("/", ",", TEMP$JOB.DATAVIS.CHARTSUSED )


TEMP <- TEMP %>% separate(JOB.DATAVIS.CHARTSUSED, c("ONE",
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

# Flow Diagram (Sankey, DAGRE, Flow Chart)


TEMP <- TEMP %>% 
  mutate(
    NAME = case_when(
      grepl("STACKED", NAME) ~ "STACKED BAR CHART",
      grepl("TIMELINE", NAME) ~ "TIMELINE",
      grepl("SCATTER", NAME) ~ "SCATTERPLOT",
      grepl("NETW", NAME) ~ "NETWORK DIAGRAM",
      grepl("HEAT", NAME) ~ "HEATMAP",
      grepl("HEX", NAME) ~ "HEXBIN",
      grepl("FLOW DIAGRAM", NAME) ~ "FLOW DIAGRAM",
      grepl("SANKEY", NAME) ~ "SANKEY",
      grepl("DAGRE", NAME) ~ "-",
      grepl("FLOW CHART)", NAME) ~ "-",
      grepl("RASTER", NAME) ~ "RASTER MAP",
      grepl("3D", NAME) ~ "3D CHARTS",
      grepl("VR", NAME) ~ "AR & VR",
      grepl("AR CHARTS", NAME) ~ "AR & VR",
      grepl("AR CHARTING", NAME) ~ "AR & VR",
      grepl("HISTOGRAM", NAME) ~ "HISTOGRAM",
      grepl("BOX", NAME) ~ "BOXPLOT",
      grepl("BEESWARM", NAME) ~ "BEESWARM",
      grepl("PARALLEL", NAME) ~ "PARALLEL COORDINATES",
      grepl("DENSITY", NAME) ~ "DENSITY PLOT",
      grepl("DOT", NAME) ~ "DOT PLOT",
      grepl("SLOPE", NAME) ~ "SLOPEGRAPH",
      grepl("BUBBLE", NAME) ~ "BUBBLE CHART",
      grepl("DONUT", NAME) ~ "DONUT CHART",
      grepl("LOLLIPOP", NAME) ~ "LOLLIPOP CHART",
      grepl("SLOPE", NAME) ~ "SLOPEGRAPH",
      grepl("SLOPE", NAME) ~ "SLOPEGRAPH",
      grepl("SLOPE", NAME) ~ "SLOPEGRAPH",
      T ~ NAME
    )
  )



# 17159
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
#     percentage = 100*count/ 17159,
#     percentage = round(percentage, digits = 2)
#   ) %>% View()
# 



filter <- TEMP %>% 
  subset(NAME != "-") %>% 
  subset(!is.na(NAME)) %>% 
  group_by(NAME) %>% 
  summarise(count = n()) %>% 
    mutate(
      percentage = 100*count/ 17159,
      percentage = round(percentage, digits = 2)
    ) %>% 
  subset(count > 10) 

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

CHARTS.USED <- TEMP
