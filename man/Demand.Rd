\name{Demand}
\alias{Demand}
\title{Per-capita demand deposits by state and year}
\description{
    The \code{Demand} data frame has 77 rows and 8 columns of data on
    per-capita demand deposits by state and year.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{H}{
	    an ordered factor with levels
	    \code{WA} < \code{FL} < \code{CA} < \code{TX} < \code{IL} < \code{DC} < \code{NY}
	}
	\item{G}{
	    an ordered factor with levels
	    \code{1949} < \dots{} < \code{1959}
	}
	\item{Y}{
	    a numeric vector of per-capita demand deposits
	}
	\item{U}{
	    a numeric vector of permanent per-capita personal income
	}
	\item{V}{
	    a numeric vector of service charges on demand deposits
	}
	\item{W}{
	    a numeric vector of interest rates on time deposits
	}
	\item{X}{
	    a numeric vector of interest rates on savings and loan
	    association shares.
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 1.2.4).

    Feige, E. L. (1964), \emph{The Demand for Liquid Assets: A Temporal
	Cross-Sectional Analysis.}, Prentice Hall.
}
\examples{
str(Demand)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  ## compare to output 3.13, p. 132
  summary(fm1Demand <-
      lmer(Y ~ 1 + U + V + W + X + (1|G) + (1|H),
         Demand))
}
}
\keyword{datasets}