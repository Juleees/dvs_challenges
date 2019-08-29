

TEMP <- ALL.YEARS


TEMP$COMMUNITY.LEADERS <-  gsub(", ", ";", TEMP$COMMUNITY.LEADERS )
TEMP$COMMUNITY.LEADERS <-  gsub(",", ";", TEMP$COMMUNITY.LEADERS )
TEMP$COMMUNITY.LEADERS <-  gsub(" ,", ";", TEMP$COMMUNITY.LEADERS )
TEMP <- TEMP %>% separate(COMMUNITY.LEADERS, c("COMM.LEADER.ONE",
                                       "COMM.LEADER.TWO",
                                       "COMM.LEADER.THREE",
                                       "COMM.LEADER.FOUR",
                                       "COMM.LEADER.FIVE",
                                       "COMM.LEADER.SIX",
                                       "COMM.LEADER.SEVEN",
                                       "COMM.LEADER.EIGHT",
                                       "COMM.LEADER.NINE",
                                       "COMM.LEADER.TEN"
                                       ), ";") %>% 
  select(YEAR,
         REGION,
         COMM.LEADER.ONE,
         COMM.LEADER.TWO,
         COMM.LEADER.THREE,
         COMM.LEADER.FOUR,
         COMM.LEADER.FIVE,
         COMM.LEADER.SIX,
         COMM.LEADER.SEVEN,
         COMM.LEADER.EIGHT,
         COMM.LEADER.NINE,
         COMM.LEADER.TEN
         )





TEMP <- gather(TEMP,VALUE,NAME, -YEAR, -REGION) %>% 
  select(YEAR, REGION, NAME) %>% 
  mutate(
    NAME = toupper(NAME)
  ) 
  


TEMP <-  TEMP %>% 
  mutate(
    NAME = case_when(
      NAME %in% c("ALBERT CAIRO", "ALBERTO CARIO") ~ "ALBERTO CAIRO",
      NAME %in% c("ALI TORBAN", "ALLI TORBIN") ~ "ALLI TORBAN",
      NAME %in% c("AMANDA KOX") ~ "AMANDA COX",
      NAME %in% c("AMELIA WATTEMBERG", "AMELIA WATTENBERG") ~ "AMELIA WATTENBERGER",
      NAME %in% c("AMY CESAL.") ~ "AMY CESAL",
      NAME %in% c("ANDY KIRK") ~ "ANDREW KIRK",
      NAME %in% c("ANDY KREIBAL", "ANDY KREIBEL") ~ "ANDY KRIEBEL",
      NAME %in% c("ANNE EMERY") ~ "ANN EMERY",
      NAME %in% c("ANYA A HEARN", "ANYA A’HEARN", "ANYA A'HEAR", "ANYA A’HEARN") ~ "ANYA A’HEARN",
      NAME %in% c("BEEN SCHNEIDEMAN", "BEN SCHNEIDEMAN", "BEN SHNEIDERMAN") ~ "BEN SCHNEIDERMAN",
      NAME %in% c("BRETT VICTOR") ~ "BRET VICTOR",
      NAME %in% c("COLE KNAFFLIC", "COLE NUSSBAUMER",
                  "STORYTELLING WITH DATA", "COLE NUSSBAUMER KNAFLIC") ~ "COLE KNAFLIC",
      NAME %in% c("DAVID MCCANDLES") ~ "DAVID MCCANDLESS",
      NAME %in% c("EVE MURRAY") ~ "EVA MURRAY",
      NAME %in% c("FERNANDA VIEGA", "FERNANDA VIÉGAS") ~ "FERNANDA VIEGAS",
      NAME %in% c("GEORGIA LUPI", "GEORGE LUPI") ~ "GIORGIA LUPI",
      NAME %in% c("JAN TULP", "JAN WILLELM TULP") ~ "JAN WILLEM TULP",
      NAME %in% c("JEFF SCHAFFER") ~ "JEFFREY SHAFFER",
      NAME %in% c("JON SCHWABISCH") ~ "JON SCHWABISH",
      NAME %in% c("JOHNATHAN HARRIS" , "JONATHAN HARRIS") ~ "JONATHAN HARRIS",
      NAME %in% c("JONATHAN SCHWABISH", "JOHN SCHWABISH",
                  "JONATHAN SCHWABBISH", "JON SCHWABISCH", "JON SCHWABISH") ~ "JONATHAN SCHWABISH",
      NAME %in% c("KAISER FU") ~ "KAISER FUNG",
      NAME %in% c("LISA CHARLOTTE ROSS") ~ "LISA CHARLOTTE ROST",
      NAME %in% c("MIKE BODSTOCK") ~ "MIKE BOSTOCK",
      NAME %in% c("NADIE BREMER", "NADIAH BREMER", "NADIEH BREMEH",
                  "NAHIEH BREMER") ~ "NADIEH BREMER",
      NAME %in% c("NATHAN YAO") ~ "NATHAN YAU",
      NAME %in% c("NG") ~ "NATIONAL GEOGRAPHIC",
      NAME %in% c("NICO BELMONTE") ~ "NICOLAS BELMONTE",
      NAME %in% c("ROBERT KOSARA NICHOLAS TROKSLER") ~ "ROBERT KOSARA",
      NAME %in% c("STEPHENIE EVERGREEN", "STEPH EVERGREEN",
                  "STEPHANIE EVERGEEN", "STEPHANIE EVERGREEN") ~ "STEPHANIE EVERGREEN",
      NAME %in% c("TABLEAU ZIN MASTERS.") ~ "TABLEAU ZEN MASTERS",
      NAME %in% c("TAMARA MUNZER") ~ "TAMARA MUNZNER",
      NAME %in% c("THE ECONOMIST") ~ "THE ECONOMIST",
      NAME %in% c("PUDDING") ~ "THE PUDDING",
      NAME %in% c("UPSHOT") ~ "THE UPSHOT",
      NAME %in% c("NYT", "NEW YORK TIME") ~ "NEW YORK TIMES",
      NAME %in% c("FT") ~ "FINANCIAL TIMES",
      NAME %in% c("JAKE VANDEPLAS", "JANE VANDERPLAS") ~ "JAKE VANDERPLAS",
      NAME %in% c("JEFF HEER") ~ "JEFFREY HEER",
      NAME %in% c("JER THORPE") ~ "JER THORP",
      NAME %in% c("KIERAN HEALY") ~ "KIERNAN HEALY",
      NAME %in% c("LYNN CHERNEY") ~ "LYNN CHERNY",
      NAME %in% c("PEDRO MIGUEL CRUZ") ~ "PEDRO CRUZ",
      NAME %in% c("PHILIPPE RIVIÈRE") ~ "PHILLIPE RIVIERE",
      NAME %in% c("RANDY OLSON", "RANDY OLSON") ~ "RANDALL S. OLSON",
      NAME %in% c("SCOTT BARINATO") ~ "SCOTT BERINATO",
      NAME %in% c("TUFTE") ~ "EDWARD TUFTE",
      NAME %in% c("TUKEY") ~ "JOHN TUKEY",
      NAME %in% c("WILLIAM S. CLEVELAND") ~ "WILLIAM CLEVELAND",
      NAME %in% c("WILKE") ~ "CLAUS WILKE",
      NAME %in% c("STEVEN FEW") ~ "STEPHEN FEW",
      NAME %in% c("MIKO YUK") ~ "MICO YUK",
      NAME %in% c("TABLEAU ZEN MASTERS", "TABLEAU", 
                  "TABLEAU AMBASSADORS", "TABLEAU COMMUNITY", 
                  "TABLEAU PUBLIC", "TABLEAU ZENS") ~ "TABLEAU",
      NAME %in% c("538") ~ "FIVETHIRTYEIGHT",
      NAME %in% c("538") ~ "FIVETHIRTYEIGHT",
      T ~ NAME
    )
  ) 


COMM.LEADERS <- TEMP %>% 
  group_by(NAME, REGION, YEAR) %>% 
  summarise(COUNT = n())

COMM.LEADERS %>% 
group_by(NAME, REGION) %>% 
  summarise(COUNT = n()) %>% View()

rm(TEMP)







#LOTS OF PEOPLE HAVE REPEATED NAMES DUE TO MISPEALLED WORDS! D:!!!