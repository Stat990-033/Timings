\name{Chem97}
\alias{Chem97}
\docType{data}
\title{Scores on A-level Chemistry in 1997}
\description{
  Scores on the 1997 A-level Chemistry examination in Britain.  Students
  are grouped into schools within local education authories.  In
  addition some demographic and pre-test information is provided.
}
\usage{data(Chem97)}
\format{
  A data frame with 31022 observations on the following 8 variables.
  \describe{
    \item{H}{Local Education Authority - a factor}
    \item{G}{School identifier - a factor}
    \item{student}{Student identifier - a factor}
    \item{Y}{Point score on A-level Chemistry in 1997}
    \item{gender}{Student's gender}
    \item{age}{Age in month, centred at 222 months or 18.5 years}
    \item{gcsescore}{Average GCSE score of individual.}
    \item{U}{Average GCSE score of individual, centered at mean.}
  }
}
\details{
  This data set is relatively large with 31,022 individuals in 2,280
  schools.  Note that while this is used, illustratively, to fit Normal
  response models, the distribution of the response is not well
  described by a Normal distribution.}
\source{
  \url{http://multilevel.ioe.ac.uk/softrev/chem97.html}

}
\references{
  Yang, M., Fielding, A. and Goldstein, H. (2002). Multilevel ordinal
  models for examination grades (submitted to \emph{Statistical Modelling}).
}
\examples{
str(Chem97)
summary(Chem97)
(fm1 <- lmer(Y ~ (1|G) + (1|H), Chem97))

}
\keyword{datasets}