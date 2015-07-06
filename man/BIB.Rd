\name{BIB}
\alias{BIB}
\title{Data from a balanced incomplete block design}
\description{
    The \code{BIB} data frame has 24 rows and 5 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{G}{
	    an ordered factor with levels
	    \code{1} < \code{2} < \code{3} < \code{8} < \code{5} < \code{4} < \code{6} < \code{7}
	}
	\item{A}{
	    a treatment factor with levels \code{1} to \code{4}.
	}
	\item{Y}{
	    a numeric vector representing the response
	}
	\item{U}{
	    a numeric vector representing the covariate
	}
	\item{g}{
	    a factor with levels
	    \code{13} and 
	    \code{24} 
	}
    }
}
\details{
    These appear to be constructed data.
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.4).
}
\examples{
str(BIB)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  xyplot(Y ~ U | G, BIB, groups = t, type = c("g", "p"),
         aspect = "xy", auto.key = list(points = TRUE, space = "right",
         lines = FALSE))
}
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with Output 5.7, p. 188
  print(fm1BIB <- lmer(Y ~ A * U + (1 | G), BIB))
  print(anova(fm1BIB))     # strong evidence of different slopes
  ## compare with Output 5.9, p. 193
  print(fm2BIB <- lmer(Y ~ A + U : g + (1 | B), BIB))
  print(anova(fm2BIB))
}
}
\keyword{datasets}