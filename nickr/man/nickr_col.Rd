% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nickr_col.R
\name{nickr_col}
\alias{nickr_col}
\title{Check that a condition holds on the columns of data between pipe stages.}
\usage{
nickr_col(.data, cond, msg = "nickr_col", active = TRUE,
  logger = stop)
}
\arguments{
\item{.data}{Incoming data (omitted if in pipe).}

\item{cond}{Column-wise condition expression to test.}

\item{msg}{User message to display if test fails.}

\item{active}{Is this check turned on (default TRUE). Set FALSE to disable test (e.g., in production).}

\item{logger}{Function to call with message (e.g., `warning` or `stop`).}
}
\value{
Input data without modification.
}
\description{
Check that a condition holds on the columns of data between pipe stages.
}
\examples{
\dontrun{
data \%>\% mutate(...) \%>\%

  # Always check that age is greater than or equal to 18.
  nickr_col(age >= 18) \%>\%

  # Only check that age lies below maximum when not in production.
  nickr_col(age <= max_age, active = !IN.PRODUCTION) \%>\%

  # Generate a warning if person_id doesn't match the expected pattern.
  nickr_col(str_detect(person_id, "[A-Z][A-Z]"),
            msg = "Person ID must be 2 letters", logger = warning) \%>\%

  # Further processing on unmodified data.
  filter(...)
}
}
