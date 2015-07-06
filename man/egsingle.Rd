\name{egsingle}
\alias{egsingle}
\docType{data}
\title{US Sustaining Effects study}
\description{
  A subset of the mathematics scores from the U.S. Sustaining Effects
  Study.  The subset consists of information on 1721 students from 60 schools
}
\usage{data(egsingle)}
\format{
  A data frame with 7230 observations on the following 6 variables.
  \describe{
    \item{H}{a factor of school identifiers}
    \item{G}{a factor of student identifiers}
    \item{U}{a numeric vector indicating the year of the test}
    \item{Y}{a numeric vector of test scores on the IRT scale score metric}
    \item{A}{a factor with levels \code{Female} \code{Male}
      indicating the student's sex}
    \item{V}{a numeric vector indicating the number of students
      enrolled in the school}
  }
}
%\details{}
\source{
  These data are distributed with the HLM software package (Bryk,
  Raudenbush and Congdon, 1996).  Conversion to the R format is
  described in Doran and Lockwood (2004).
}
\references{
  Doran, Harold C. and Lockwood, J.R. (2004), \emph{Fitting value-added
    models in R}, (submitted).
}
\examples{
str(egsingle)
(fm1 <- lmer(Y~U*V+A+(1|G)+(1|H), egsingle))
}
\keyword{datasets}