
TEMP <- ALL.YEARS


TEMP <- TEMP %>% 
  mutate(
    EDU.BACKGROUND = toupper(EDU.BACKGROUND)
  ) 


TEMP <- TEMP %>% 
  mutate(
    EDU.BACKGROUND = case_when(
      EDU.BACKGROUND %in% c("SOME COLLEGE", 
                     "SOME COLLEGE, NO DEGREE, SELF TAUGHT",
                     "SOME COLLEGE, NO DEGREE.", 
                     "SOME COLLEGE.",
                     "SOME COLLEGE. THIS PROBABLY SHOULD HAVE BEEN AN OPTION.",
                     "SOME COLLEGE; NO DEGREE",
                     "SOME UNIVERSITY",
                     "SOME J-SCHOOL + WORKSHOPS"
                     ) ~ "SOME COLLEGE",
      EDU.BACKGROUND %in% c("BACHELORS", 
                     "BACHELOR OF FINE ARTS",
                     "CURRENTLY UNIVERSITY STUDENT",
                     "AAS/WORK TOWARD BA.",
                     "MATHS GRADUATE",
                     "ED.D") ~ "BACHELORS",
      EDU.BACKGROUND %in% c("PHD",
                     "CURRENTLY IN PHD PROGRAM", 
                     "PHD AND MASTER",
                     "DOING PHD",
                     "STUDYING FOR PHD",
                     "PHD STUDENT",
                     "PHD EXPECTED 2020",
                     "ABD",
                     "DRPH (DOCTORATE OF PUBLIC HEALTH), MGIS, MPH",
                     "PH D CANDIDATE",
                     "DOCTORATE, MSC, AND EXECUTIVE EDUCATION APPLIED DATA ANALYTICS",
                     "MULTIPLE OF THESE--AND A DOCTORATE.") ~ "PHD",
      EDU.BACKGROUND %in% c("MASTERS",
                     "FINSIHING MASTERS",
                     "IN SCHOOL FOR MY MASTERS NOW",
                     "MASTERS & ABD",
                     "MLIS, MASTER OF LIBRARY AND INFORMATION SCIENCE",
                     "PURSUING A MASTERS") ~ "MASTERS",
      EDU.BACKGROUND %in% c("POST GRADUATE",
                            "POST GRAD CERTIFICATE.",
                            "POST GRAD DIPLOMA (NOT MASTERS)",
                            "POST GRADUATE DIPLOMA",
                            "GRADUATE LEVEL") ~ "POST GRADUATE",
      EDU.BACKGROUND %in% c("ASSOCIATES",
                            "ASSOCIATES OF SCIENCE",
                            "2 YEARS UNDERGRAD",
                            "MODERN APPRENTICESHIP IN CREATIVE DIGITAL MEDIA") ~ "ASSOCIATE",
      EDU.BACKGROUND %in% c("HIGH SCHOOL",
                            "HIGH SCHOOL, AND A FEW COLLEGE CLASSES",
                            "HIGH SCHOOL, SOME COLLEGE (NO DEGREE)",
                            "JUST HIGH-SCHOOL AND LIFE-LONG-LEARNING") ~ "HIGH SCHOOL",
      EDU.BACKGROUND %in% c("AUTODIDACT",
                            "NONE",
                            "NONE? MIGHT WANT TO ADJUST THIS QUESTION.",
                            "SCHOOL",
                            "SELF TAUGHT",
                            "WORK/ON THE JOB",
                            "SCHOOL",
                            "DROPOUT",
                            "DIPLOMA",
                            "HIGHER EDUCATION NONE DEGREE",
                            "HONORS DEGREE",
                            "CULINARY ARTS SCHOOL",
                            "MD",
                            "I DROPPED OUT OF SCHOOL IN GRADE 9. YES, REALLY.",
                            "NO DEGREE") ~ "OTHER",
      T ~ EDU.BACKGROUND
    )
  ) 




TEMP %>% 
  group_by(EDU.BACKGROUND, YEAR) %>% 
  summarise(count = n()) %>% View()

ALL.YEARS <- TEMP