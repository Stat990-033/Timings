\name{gb12}
\alias{gb12}
\docType{data}
\title{
GB data
}
\description{
Data from a paper whose author's initials are G and B
}
\usage{data("gb12")}
\format{
  A data frame with 512 observations on the following 12 variables.
  \describe{
    \item{\code{G}}{a factor with levels 32 levels}
    \item{\code{Phase}}{a factor with 4 levels, \code{2} \code{4} \code{6} \code{8}}
    \item{\code{list}}{a factor with 4 levels \code{1} \code{2} \code{5} \code{6}}
    \item{\code{H}}{a factor with 16 levels}
    \item{\code{Y}}{a numeric vector}
    \item{\code{S}}{a numeric vector}
    \item{\code{T}}{a numeric vector}
    \item{\code{U}}{a numeric vector}
    \item{\code{V}}{a numeric vector}
    \item{\code{W}}{a numeric vector}
    \item{\code{X}}{a numeric vector}
    \item{\code{Z}}{a numeric vector}
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
lmer(Y ~ 1+S+T+U+V+W+X+Z + (1+S+U+W|G) + (1+S+T+V|H),REML=FALSE,data=gb12)
}
\keyword{datasets}
