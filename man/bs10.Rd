\name{bs10}
\alias{bs10}
\docType{data}
\title{
Barr and ... 2010
}
\description{
Data from a paper by Barr and ... 2010
}
\usage{data("bs10")}
\format{
  A data frame with 1104 observations on the following 6 variables.
  \describe{
    \item{\code{G}}{a factor with 92 levels }
    \item{\code{H}}{a factor with 12 levels }
    \item{\code{Y}}{a numeric vector}
    \item{\code{U}}{a numeric vector}
    \item{\code{V}}{a numeric vector}
    \item{\code{W}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
lmer(Y ~ 1+U+V+W + (1+U+V+W|G) + (1+U+V+W|H),REML=FALSE,data=bs10)
}
\keyword{datasets}
