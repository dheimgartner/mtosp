% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preference_constraints.R
\name{preference_constraints}
\alias{preference_constraints}
\title{Apply preference constraints}
\usage{
preference_constraints(full_factorial, sub = 0)
}
\arguments{
\item{full_factorial}{from \code{generate_candidate_set}}

\item{sub}{substitution for not available (defaults to 0)}
}
\value{
reduced factorial \code{data.frame} with \code{sub} if availability == 0 or
if attribute should not be shown for another reason (see above).
}
\description{
Since we use archetypes, we do not really need to apply preference constraints within
a mobility tool. The constraints applied here are mainly with regard to MTO combination
and shutting certain attributes off (e.g. battery capacity if car is not electric).
}
