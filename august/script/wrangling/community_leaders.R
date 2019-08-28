

TEMP <- ALL.YEARS


TEMP$COMMUNITY.LEADERS <-  gsub(",", ";", TEMP$COMMUNITY.LEADERS )
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


TEMP <- TEMP %>% gather()


INFLUENCERS <- gather(TEMP,VALUE,NAME,COMM.LEADER.ONE:COMM.LEADER.TEN, -YEAR) %>% 
  select(YEAR, NAME) %>% 
  group_by( NAME) %>% 
  summarise(COUNT = n()) %>% View()


#LOTS OF PEOPLE HAVE REPEATED NAMES DUE TO MISPEALLED WORDS! D:!!!