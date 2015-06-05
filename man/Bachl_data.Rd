\name{Bachl_data}
\alias{Bachl_data}
\docType{data}
\title{
Bachl_data (d3)
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("Bachl_data")}
\format{
  A data frame with 130418 observations on the following 4 variables.
  \describe{
    \item{\code{r}}{a numeric vector (formerly encoded as rtr2)}
    \item{\code{ts}}{a numeric vector (formerly encoded as turnsec)}
    \item{\code{ti}}{a factor with 34 levels (formerly encoded as turnid)}
    \item{\code{i}}{a factor with 172 levels (formerly idnr)}
    \item{\code{i.t}}{a factor with 4726 levels for the interaction between i and ti}
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
lmer(rtr2 ~ ts + (ts | i.t) +(ts | ti) + (ts | i),verbose = TRUE, d3)
\keyword{datasets}
