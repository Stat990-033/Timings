\name{Genetics}
\alias{Genetics}
\title{Heritability data}
\description{
The \code{Genetics} data frame has 60 rows and 5 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{H}{
	    a factor with levels \code{1} to \code{4} 
	}
	\item{b}{
	    a factor with levels \code{1} to \code{3}
	}
	\item{A}{
	    a factor with levels \code{1} to \code{5}
	}
	\item{Y}{
	    a numeric vector of crop yields
	}
    \item{G}{
        a factor for the interaction effect of H and b
    }
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 4.5).
}
\examples{
str(Genetics)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  summary(fm1Gen <- lmer(Y ~ A + (1|H)+(1|G), Genetics))
}
}
\keyword{datasets}