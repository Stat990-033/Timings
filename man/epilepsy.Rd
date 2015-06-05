\name{epilepsy}
\alias{epilepsy}
\docType{data}
\title{
Epilepsy data from HSAUR2 package
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("epilepsy")}
\format{
  A data frame with 236 observations on the following 6 variables.
  \describe{
    \item{\code{t}}{a factor with levels \code{placebo} \code{Progabide}}
    \item{\code{b}}{a numeric vector}
    \item{\code{a}}{a numeric vector}
    \item{\code{s.r}}{a numeric vector}
    \item{\code{p}}{an ordered factor with levels \code{1} < \code{2} < \code{3} < \code{4}}
    \item{\code{sub}}{a factor with levels 59 levels}
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
epilepsy.2 <- transform(epilepsy,Visit4=(p==4))
glmer(s.r~log(b)*t+Visit4+log(a)+(1|sub),family="poisson",data=epilepsy.2)
}
\keyword{datasets}
