ngene_toy_example <- function() {

  attributes <-
    list(
      A_price = c(100, 150, 200, 0),
      A_stars_available = c(1, 0),
      A_stars = c(1, 3, 5, 0),
      A_distance = c(500, 1000, 1500, 0),
      A_wifi = c(1, 0),
      A_breakfast = c(1, 0),
      A_pool = c(1, 0),
      B_price = c(100, 150, 200, 0),
      B_stars_available = c(1, 0),
      B_stars = c(1, 3, 5, 0),
      B_distance = c(500, 1000, 1500, 0),
      B_wifi = c(1, 0),
      B_breakfast = c(1, 0),
      B_pool = c(1, 0)
    )

  full <- as.data.frame(expand.grid(attributes))

  full <-
    full %>%
    mutate(A_stars = ifelse(A_stars_available == 0, 0, A_stars),
           B_stars = ifelse(B_stars_available == 0, 0, B_stars)) %>%
    distinct() %>%
    filter(!(A_stars_available == 1 & A_stars == 0),
           !(B_stars_available == 1 & B_stars == 0))

  tmp <- data.frame(resp = 1, s = 1:nrow(full))

  ngene <- cbind(tmp, full)

  ngene <- ngene[1:13608, ]
  nm <- names(ngene)
  nn <- stringr::str_remove_all(nm, "^A_|^B_")
  names(ngene) <- nn

  xlsx::write.xlsx2(ngene, file = "./data/ngene_toy_example.xlsx", row.names = FALSE)

  ngene

}
