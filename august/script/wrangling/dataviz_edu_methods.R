
TEMP <- ALL.YEARS


TEMP$DATAVIS.EDU.METHOD <-  gsub(", ", ",", TEMP$DATAVIS.EDU.METHOD )
TEMP$DATAVIS.EDU.METHOD <-  gsub(",", ",", TEMP$DATAVIS.EDU.METHOD )
TEMP$DATAVIS.EDU.METHOD <-  gsub(" ,", ",", TEMP$DATAVIS.EDU.METHOD )


TEMP <- TEMP %>% separate(DATAVIS.EDU.METHOD, c("ONE",
                                               "TWO",
                                               "THREE",
                                               "FOUR",
                                               "FIVE",
                                               "SIX",
                                               "SEVEN",
                                               "EIGHT",
                                               "NINE",
                                               "TEN"
), ",") %>% 
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
         TEN
  )


TEMP <- gather(TEMP,VALUE,NAME, -YEAR, -REGION) %>% 
  select(YEAR, REGION, NAME) %>% 
  mutate(
    NAME = toupper(NAME)
  ) 


TEMP <-  TEMP %>% 
  mutate(
    NAME = case_when(
      NAME %in% c("BLOGS", "BLOG POSTS",
                  "BLOG POSTS / ONLINE TUTORIALS",
                  "ARTICLES", "MEDIUM ARTICLES",
                  "TUTORIAL ARTICLES", 
                  "ARTICLES / ATTENDING CONFERENCES (IEEE VIS AND OTHERS)") ~ "BLOG POSTS & ARTICLES",
      NAME %in% c("CONFERENCE PRESENTATIONS",
                  "CONFERENCE VIDEOS", 
                  "CONFERENCES",
                  "SHORT LECTURES AT CONFERENCES") ~ "CONFERENCES",
      NAME %in% c("ONLINE CLASSES", "ONLINE CLASSES",
                  "ONLINE COURSES", "ONLINE TUTORIAL",
                  "INTERACTIVE LESSONS LIKE DATACAMP",
                  "UDEMY COURSE",
                  "ONLINE TUTORIALS", "WRITTEN ONLINE TUTORIALS",
                  "VIDEO TUTORIALS", "MOOCS",
                  "STACKOVERFLOW.COM AND OTHER ONLINE TUTORIALS",
                  "STACK OVERFLOW", "STACKEXCHANGE",
                  "VIDEO/ON-LINE TUTORIALS", "HOW-TOS",
                  "INTERACTION DESIGN FOUNDATION COURSE ONLINE",
                  "I USED EXAMPLES AND VIDEO TUTORIALS") ~ "ONLINE COURSES & TUTORIALS",
      NAME %in% c("PODCAST") ~ "PODCASTS",
      NAME %in% c("#MAKEOVERMONDAY COMMUNITY") ~ "MAKEOVER MONDAY",
      NAME %in% c("WORKING THROUGH A PROJECT", 
                  "PRACTICE", "SELF-MOTIVATED PROJECTS",
                  "LOTS OF REPETITION", "PROJECTS", "REMAKING OTHER PEOPLE'S WORK",
                  "PRACTICAL APPLICATION", "TWEAK SOMETHING",
                  "MAKING VISUALIZATIONS", "TRY TO MAKE SOMETHING",
                  "WORKING THROUGH OUTCOME-FOCUSED WALKTHROUGHS WHICH STEP YOU THROUGH THE SETUP STEPS AND PRACTICAL TASKS REQUIRED TO BUILD SOMETHING REAL.",
                  "TRIAL AND ERROR") ~ "WORKING THROUGH A PROJECT",
      NAME %in% c("A COMBINATION OF METHODS: BOOKS",
                  "BOOKS HELPED AT FIRST") ~ "BOOKS",
      NAME %in% c("CLASSES AT THE GRADUATE LEVEL",
                  "COLLEGE COURSES", "PROFESSOR'S LECTURE",
                  "FORMAL TAUGHT COURSES", "STUDIO/ACADEMIC ENVIRONMENT",
                  "IN PERSON CLASSES") ~ "CLASSROOM TRAINING",
      NAME %in% c("CASE STUDIES",
                  "INTERACTIVE EXAMPLES", "RPUBS.COM EXAMPLES",
                  "LOOKING AT OTHER DATA VIZ") ~ "EXAMPLES",
      NAME %in% c("AND WORKSHOPS. NEED THE BALANCE.") ~ "WORKSHOPS",
      NAME %in% c("ART") ~ "ART",
      NAME %in% c("PACKAGE/LIBRARY DOCUMENTATION") ~ "LIBRARY DOCUMENTATION",
      NAME %in% c("UNDERSTANDING STATISTICS AND DATA STRUCTURES") ~ "STUDY STATISTICS",
      NAME %in% c("SOME COMBINATION OF SKILLED PRACTITIONERS AND BOOKS/WORKSHOPS",
                  "REAL-LIFE COLLABORATING AND BOOKS") ~ "BOOKS",
      NAME %in% c("A MIX OF ALL OF THE ABOVE",
                  "ALL OF THE ABOVE",
                  "BUT NOW IT'S ALL ABOUT TWITTER", 
                  "COMBINATION OF USING READY MADE TOOLS",
                  "COMBINING ALL OF THE ABOVE", 
                  "DEPENDS REALLY ON WHERE YOU ARE ON YOUR JOURNEY",
                  "DESIGN-BASED APPROACHES", 
                  "DISCUSSIONS ON SOCIAL MEDIA",
                  "ETC.", "HANDS-ON (WITH A SUFFICIENTLY INTUITIVE TOOL)",
                  "HANDS ON TINKERING WITH VISUALIZATION LIBRARIES",
                  "I GUESS ALL OF THE ABOVE", 
                  "INCLUDING COLLABORATION", "INTERACTIONS AND GOOGLE",
                  "MEETUP.COM", "MIX OF SEVERAL", "MIX OF THE ABOVE",
                  "MULTIPLE: EXAMPLES AND COLLABORATION", 
                  "USER GROUPS", "TIDY TUESDAY STYLE LEARNING",
                  "STUDIO ART TEACHING METHODS", "USER GROUPS",
                  "DEPENDS ON LEARNING STYLE TOO. I USED A COMBINATION OF THESE.",
                  "DEPENDS REALLY ON WHERE YOU ARE ON YOUR JOURNEY",
                  "DOING IT WITH YOUR OWN DATA AND GETTING DIRECT FEEDBACK",
                  "END USER FEEDBACK AS PART OF THE TRAINING/IMPACT ANALYSIS",
                  "READING AND CREATING CRITIQUES OF OTHER PEOPLE'S WORKS",
                  "WEBSITE ARTICLES AND EXAMPLES GIVE ME A LOT OF INSPIRATION") ~ "OTHER",
      T ~ NAME
    )
  ) 

EDU.METHODS <- TEMP %>% 
  group_by( REGION, YEAR, NAME) %>% 
  summarise(COUNT = n())


  