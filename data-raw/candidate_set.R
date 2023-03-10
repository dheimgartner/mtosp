## code to prepare `candidate_set` dataset goes here

library(tidyverse)

devtools::load_all()

rm(list = ls())

candidate_set <- mtosp::generate_candidate_set(keep = 1000)

# candidate_set <- mtosp::generate_candidate_set(keep = 1000, ngene = TRUE, names = FALSE)
# xlsx::write.xlsx2(candidate_set, file = "./data/candidate_set.xlsx", row.names = FALSE)

usethis::use_data(candidate_set, overwrite = TRUE)
