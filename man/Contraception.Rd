\name{Contraception}
\alias{Contraception}
\docType{data}
\title{Contraceptive use in Bangladesh}
\description{
  These data on the use of contraception by women in urban and rural
  areas come from the 1988 Bangladesh Fertility Survey.
}
\usage{data(Contraception)}
\format{
  A data frame with 1934 observations on the following 6 variables.
  \describe{
    \item{w}{Identifying code for each woman - a factor}
    \item{d}{Identifying code for each district - a factor}
    \item{use}{Contraceptive use at time of survey}
    \item{l}{Number of living children at time of survey - an
      ordered factor.  Levels are \code{0}, \code{1}, \code{2}, \code{3+}}
    \item{a}{Age of woman at time of survey (in years), centred around
      mean.}
    \item{urb}{Type of region of residence - a factor.  Levels are
      \code{urban} and \code{rural}}
  }
}
%\details{}
\source{
  \url{http://multilevel.ioe.ac.uk/softrev/bang.html}
}
\references{
  Steele, F., Diamond, I. And Amin, S. (1996). Immunization uptake in
  rural Bangladesh: a multilevel analysis. \emph{Journal of the Royal
    Statistical Society, Series A} (159): 289-299.
}
\examples{
str(Contraception)
summary(Contraception)
(fm1 <- glmer(use ~ urb+a+l+(1|d), Contraception, binomial))
(fm2 <- glmer(use ~ urb+a+l+(urb|d), Contraception, binomial))
}
\keyword{datasets}