\name{Semiconductor}
\alias{Semiconductor}
\title{Semiconductor split-plot experiment}
\description{
    The \code{Semiconductor} data frame has 48 rows and 5 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{Y}{
	    a numeric vector
	}
	\item{A}{
	    a factor with levels \code{1} to \code{4} representing etch time.
	}
	\item{w}{
	    a factor with levels \code{1} to \code{3} 
	}
	\item{B}{
	    a factor with levels \code{1} to \code{4} 
	}
	\item{G}{
	    an ordered factor with levels
	    \code{1/1} < \code{1/2} < \code{1/3} < \code{2/1} < \code{2/2} < \code{2/3} < \code{3/1} < \code{3/2} < \code{3/3} < \code{4/1} < \code{4/2} < \code{4/3}
	}
    }
}
%\details{}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 2.2(b)).

}
\examples{
str(Semiconductor)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  print(fm1Semi <- lmer(Y ~ A * B + (1|G), Semiconductor))
  print(anova(fm1Semi))
  print((fm2Semi <- lmer(Y ~ A + B + (1|G), Semiconductor)))
  print(anova(fm2Semi))
}
}
\keyword{datasets}