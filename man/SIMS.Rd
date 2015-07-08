\name{SIMS}
\alias{SIMS}
\title{Second International Mathematics Study data}
\description{
  The \code{SIMS} data frame has 3691 rows and 3 columns.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{U}{
      a numeric vector giving the student's pre-test total score
    }
    \item{Y}{
      a numeric vector giving gains from pre-test to the final test
    }
    \item{G}{
      an ordered factor giving the student's class
    }
  }
}
%\details{}
\source{
  Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
  R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
  (section 7.2.2)

  Kreft, I. G. G., De Leeuw, J. and Var Der Leeden, R. (1994),
  ``Review of five multilevel analysis programs: BMDP-5V, GENMOD, HLM,
  ML3, and VARCL'', \emph{American Statistician}, \bold{48}, 324--335.
}
\examples{
str(SIMS)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare to output 7.4, p. 262
  print(fm1SIMS <- lmer(Y ~ U + (U | G), data = SIMS))
  print(anova(fm1SIMS))
}
}
\keyword{datasets}