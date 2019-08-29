library(tidyverse)

survey.2017 <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vThG-RH5yxJWbo-iAZ7s9xhSUwkeoEKTF7WMZT0yOXm8r3so8lm1R8FLZ7jvAo9eyOOUBBaoE3oQbnp/pub?gid=2115774317&single=true&output=csv"
)

survey.2018 <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vSb0zzW9Hstc1FKD3ypS1uXZUcIXHZcHUFMBK_7AtMK7zYeL4oiUlhINGH5L_4SMfovTFzJMCMx_vsB/pub?gid=1926742553&single=true&output=csv"
)

survey.2019 <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vQlKBlheOfocbBLn5JKndPsVPMJ5UCBgY5n884oJrgh4y4CCCMzYGzRiKGF_dBp9DOK-3-2_H8KYnH6/pub?gid=818679923&single=true&output=csv"
)
source(here::here("script","colnames_lists.R"))

'%nin%' <- function(x,y)!('%in%'(x,y))
