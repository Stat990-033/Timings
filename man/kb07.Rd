\name{kb07}
\alias{kb07}
\docType{data}
\title{
Kronmueller and Barr, 2007 data
}
\description{
Data described in Kronmueller and Barr, 2007 and referenced in Barr et al., 2013
}
\usage{data("kb07")}
\format{
  A data frame with 1790 observations on the following 10 variables.
  \describe{
    \item{\code{G}}{a factor with 56 levels}
    \item{\code{H}}{a factor with 32 levels}
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
Barr, Dale J., Levy, Roger, Scheepers, Christoph and Tily, Harry J
  (2013) Random effects structure for confirmatory hypothesis testing:
  Keep it maximal, \emph{Journal of Memory and Language}, \bold{68},
  pp. 255-278
}
\references{
Kronmueller, Edmundo and Barr, Dale J (2007)
  Perspective-free pragmatics: Broken precedents and the
  recovery-from-preemption hypothesis,  \emph{Journal of Memory and
    Language}, \bold{56}, pp. 436-455
}
\examples{
lmer(Y ~ 1+S+T+U+V+W+X+Z + (1+S+T+U+V+W+X+Z|G) + (1+S+T+U+V+W+X+Z|H), REML=FALSE,data=kb07)
}
\keyword{datasets}
