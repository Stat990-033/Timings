\name{AvgDailyGain}
\alias{AvgDailyGain}
\title{Average daily weight gain of steers on different diets}
\description{
    The \code{AvgDailyGain} data frame has 32 rows and 6 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{Id}{
	    the animal number
	}
	\item{G}{
	    an ordered factor indicating the barn in which the steer was housed.
	}
	\item{A}{
	    an ordered factor with levels
	    \code{0} < \code{10} < \code{20} < \code{30}
	    indicating the amount of medicated feed additive added to
	    the base ration.
	}
	\item{Y}{
	    a numeric vector of average daily weight gains over a period
	    of 160 days.
	}
	\item{U}{
	    a numeric vector giving the initial weight of the animal
	}
	\item{Trt}{
	    the \code{Treatment} as a numeric variable
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.3).
}
\examples{
str(AvgDailyGain)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  ## plot of adg versus Treatment by Block
  xyplot(Y ~ A | G, AvgDailyGain, type = c("g", "p", "r"),
         xlab = "Treatment (amount of feed additive)",
         ylab = "Average daily weight gain (lb.)", aspect = "xy",
         index.cond = function(x, y) coef(lm(y ~ x))[1])
}
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 5.1, p. 178
  print(fm1Adg <- lmer(Y ~ U * A - 1 + (1 | G),
                         AvgDailyGain))
  print(anova(fm1Adg))   # checking significance of terms
  print(fm2Adg <- lmer(Y ~ U + A + (1 | G),
                         AvgDailyGain))
  print(anova(fm2Adg))
  print(lmer(Y ~ U + A - 1 + (1 | G), AvgDailyGain))
}
}
\keyword{datasets}