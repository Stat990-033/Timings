\name{Poems}
\alias{Poems}
\docType{data}
\title{
Baayen and Milin 
}
\description{
Data described in Baayen and Milin (2010). 
}
\usage{data("Poems")}
\format{
  A data frame with 275996 observations on the following 7 variables.
  \describe{
    \item{\code{G}}{a factor with 2315 levels }
    \item{\code{H}}{a factor with 326 levels }
    \item{\code{I}}{a factor with 87 levels }
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
 Baayen, R. H. and Milin, P (2010) Analyzing reaction times. 
  \emph{International Journal of Psychological Research}, 
  \bold{3.2}, pp. 12-28.
}
\references{
Baayen, R. H. and Milin, P (2010) Analyzing reaction times. 
  \emph{International Journal of Psychological Research}, 
  \bold{3.2}, pp. 12-28.
}
\examples{
lmer(Y ~ 1 + U + V + (1|G) + (1|H) + (1|I),REML=FALSE,data=Poems)
}
\keyword{datasets}
