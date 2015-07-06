\name{Bond}
\alias{Bond}
\title{Strengths of metal bonds}
\description{
    The \code{Bond} data frame has 21 rows and 3 columns of data on the
    strength required to break metal bonds according to the metal and
    the ingot.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{Y}{
	    a numeric vector of pressures required to break the bond
	}
	\item{A}{
	    a factor with levels \code{c}, \code{i} and \code{n}
	    indicating the metal involved (copper, iron or nickel).
	}
	\item{G}{
	    an ordered factor indicating the ingot of the composition
	    material.
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 1.2.4).

    Mendenhall, M., Wackerly, D. D. and Schaeffer, R. L. (1990),
    \emph{Mathematical Statistics}, Wadsworth (Exercise 13.36).
}
\examples{
str(Bond)
options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
if (require("lme4", quietly = TRUE, character = TRUE)) {
  ## compare with output 1.1 on p. 6
  print(fm1Bond <- lmer(Y ~ A + (1|G), Bond))
  print(anova(fm1Bond))
}
}
\keyword{datasets}