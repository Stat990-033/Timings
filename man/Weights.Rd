\name{Weights}
\alias{Weights}
\title{Data from a weight-lifting program}
\description{
    The \code{Weights} data frame has 399 rows and 4 columns.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{Y}{
      a numeric vector
    }
    \item{A}{
      a factor with levels
      \code{CONT} (continuous repetitions and weights),
      \code{RI} (repetitions increasing) and
      \code{WI} (weights increasing)
    }
    \item{G}{
      an ordered factor indicating the subject on which the
      measurement is made
    }
    \item{U}{
      a numeric vector indicating the time of the measurement
    }
  }
}
\source{
  Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
  R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
  (Data Set 3.2(a)).
}
\examples{
str(Weights)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 3.1, p. 91
  print(fm1Weight <- lmer(Y~ A* U+ (1|G), Weights))
  print(anova(fm1Weight))
  print(fm2Weight <- lmer(Y~ A* U+ (U|G), Weights))
  print(anova(fm1Weight, fm2Weight))
\dontrun{
intervals(fm2Weight)
fm3Weight <- update(fm2Weight, correlation = corAR1())
anova(fm2Weight, fm3Weight)
fm4Weight <- update(fm3Weight, Y~ A* (U+ I(U^2)),
                    random = ~U|G)
summary(fm4Weight)
anova(fm4Weight)
intervals(fm4Weight)
}
}
}
\keyword{datasets}