\name{d3}
\alias{d3}
\docType{data}
\title{d3 dataset (formerly Bachl_data)
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("d3")}
\format{
  A data frame with 130418 observations on the following 4 variables.
  \describe{
    \item{\code{Y}}{a numeric vector (formerly encoded as rtr2)}
    \item{\code{U}}{a numeric vector (formerly encoded as turnsec)}
    \item{\code{I}}{a factor with 34 levels (formerly encoded as turnid)}
    \item{\code{H}}{a factor with 172 levels (formerly idnr)}
    \item{\code{G}}{a factor with 4726 levels for the interaction between i and ti}
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
lmer(Y ~ U + (U | G) +(U | H) + (U | I),verbose = TRUE, d3)
}
\keyword{datasets}
