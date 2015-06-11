\name{Mississippi}
\alias{Mississippi}
\title{Nitrogen concentrations in the Mississippi River}
\description{
The \code{Mississippi} data frame has 37 rows and 3 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{i}{
	    an ordered factor with levels
	    \code{3} < \code{5} < \code{2} < \code{1} < \code{4} < \code{6}
	}
	\item{y}{
	    a numeric vector
	}
	\item{t}{
	    a factor with levels
	    \code{1} 
	    \code{2} 
	    \code{3} 
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 4.2).
}
\examples{
str(Mississippi)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  dotplot(drop(i:t) ~ y, groups = t, Mississippi)
} 
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 4.1, p. 142
  print(fm1Miss <- lmer(y ~ 1 + (1|i), Mississippi))
  ## compare with output 4.2, p. 143
  print(fm1MLMiss <- update(fm1Miss, REML=FALSE))
  ## BLUP's of random effects on p. 142
  ranef(fm1Miss)            
  ## BLUP's of random effects on p. 144
  print(ranef(fm1MLMiss))
#intervals(fm1Miss)       # interval estimates of variance components
  ## compare to output 4.8 and 4.9, pp. 150-152
  print(fm2Miss <- lmer(y ~ t+(1|i), Mississippi, REML=TRUE))
  print(anova(fm2Miss))
}
}
\keyword{datasets}