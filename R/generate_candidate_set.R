#' Generates a candidate set for implicit partial profile
#'
#' @seealso ngene user manual
#'
#' @param keep random sample to keep (defines nrows of output)
#' @param names should "A_" and "B_" prefix be added for bundles (defaults to `TRUE`).
#' @param ngene The ngene user manual suggests, that the candidature set does not
#' have these prefixes, but repeated col names for the bundles (defaults to `FALSE`).
#'
#' @return ngene candidate set (conforms to examples in ngene user manual)
#' @export
generate_candidate_set <- function(keep = NULL, names = TRUE, ngene = FALSE) {

  ## full factorial
  attributes <-
    list(
      ca_available = c(1, 0),
      ca_type = c(1, 2, 3, 4, 5),
      ca_fuel = c(1, 2, 3, 4, 5),
      ca_reach = c(1, 2),
      ca_fix_cost = c(1, 2),
      ca_variable_cost = c(1, 2),
      cs_available = c(1, 0),
      cs_membership_fee = c(1, 2),
      cs_time_tariff = c(1, 2),
      cs_km_tariff = c(1, 2),
      cs_distance = c(1, 2),
      eb_available = c(1, 0),
      eb_type = c(1, 2),
      eb_cost = c(1, 2),
      pt_available = c(1, 0),
      pt_type = c(1, 2, 3),
      pt_class = c(1, 2),
      pt_zones = c(1, 2),
      pt_commute = c(1, 2),  ## included not included (0 is reserved for not showing)
      pt_fix_cost = c(1, 2),
      pt_variable_cost = c(1, 2)
    )

  full <- as.data.frame(expand.grid(attributes))

  ## preference constraints
  reduced <-
    mtosp::preference_constraints(full, sub = 0)

  ## candidate bundles
  A <- reduced[sample(1:nrow(reduced)), ]
  B <- reduced[sample(1:nrow(reduced)), ]

  if (names) {
    names(A) <- paste0("A_", names(A))
    names(B) <- paste0("B_", names(B))
  }

  df <- cbind(A, B)

  if (!is.null(keep)) {
    df <- df[sample(1:keep), ]
  }

  if (ngene) {
    tmp <- data.frame(resp = 1, s = 1:nrow(df))

    df <- cbind(tmp, df)
  }

  df

}
