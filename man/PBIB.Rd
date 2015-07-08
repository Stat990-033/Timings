\name{PBIB}
\alias{PBIB}
\title{A partially balanced incomplete block experiment}
\description{
    The \code{PBIB} data frame has 60 rows and 3 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{Y}{
	    a numeric vector
	}
	\item{A}{
	    a factor with levels \code{1} to \code{15} 
	}
	\item{G}{
	    an ordered factor with levels \code{1} to \code{15} 
	}
    }
}
%\details{}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 1.5.1).
}
\examples{
str(PBIB)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 1.7  pp. 24-25
  print(fm1PBIB <- lmer(Y ~ A + (1|G), PBIB))
  print(anova(fm1PBIB))
}
}
\keyword{datasets}