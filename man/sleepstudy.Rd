\docType{data}
\name{sleepstudy}
\alias{sleepstudy}
\title{Reaction times in a sleep deprivation study}
\format{A data frame with 180 observations on the following 3 variables.
  \describe{
    \item{\code{r}}{Average reaction time (ms)}
    \item{\code{d}}{Number of days of sleep deprivation}
    \item{\code{s}}{Subject number on which the observation was made.}
  }}
\description{
  The average reaction time per day for subjects in a sleep
  deprivation study. On day 0 the subjects had their normal
  amount of sleep.  Starting that night they were
  restricted to 3 hours of sleep per night.  The
  observations represent the average reaction time on a
  series of tests given each day to each subject.
}
\details{
  These data are from the study described in Belenky et al.
  (2003), for the sleep-deprived group and for the first 10
  days of the study, up to the recovery period.
}
\examples{
str(sleepstudy)
require(lattice)
xyplot(r ~ d | s, sleepstudy, type = c("g","p","r"),
       index = function(x,y) coef(lm(y ~ x))[1],
       xlab = "Days of sleep deprivation",
       ylab = "Average reaction time (ms)", aspect = "xy")
(fm1 <- lmer(r ~ d + (d|s), sleepstudy))
(fm2 <- lmer(r ~ d + (1|s) + (0+d|s), sleepstudy))
}
\references{
  Gregory Belenky, Nancy J. Wesensten, David R. Thorne,
  Maria L. Thomas, Helen C. Sing, Daniel P. Redmond,
  Michael B. Russo and Thomas J. Balkin (2003) Patterns of
  performance degradation and restoration during sleep
  restriction and subsequent recovery: a sleep
  dose-response study. \emph{Journal of Sleep Research}
  \bold{12}, 1--12.
}
\keyword{datasets}