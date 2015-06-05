\name{Arabidopsis}
\alias{Arabidopsis}
\docType{data}
\title{
  Arabidopsis clipping/fertilization data
}
\description{
  Data on genetic variation in responses to fertilization
  and simulated herbivory in \emph{Arabidopsis}
}
\usage{data("Arabidopsis")}
\format{
  A data frame with 625 observations on the following 8 variables.
  \describe{
    \item{\code{re}}{region: a factor with 3 levels \code{NL}
      (Netherlands), \code{SP} (Spain), \code{SW} (Sweden)}
    \item{\code{p}}{population: a factor with the form \code{n.R}
      representing a population in region \code{R}}
    \item{\code{g}}{genotype: a factor with 24 (numeric-valued) levels}
    \item{\code{r}}{a nuisance factor with 2 levels, one for
      each of two greenhouse racks}
    \item{\code{n}}{fertilization treatment/nutrient level (1,
      minimal nutrients or 8, added nutrients)}
    \item{\code{a}}{simulated herbivory or "clipping" (apical meristem
      damage): \code{unclipped} (baseline) or \code{clipped}}
    \item{\code{s}}{a nuisance factor for germination method
      (\code{Normal}, \code{Petri.Plate}, or \code{Transplant})}
    \item{\code{t.f}}{total fruit set per plant (integer)}
  }
}
\source{
  From Josh Banta
}
\references{
  Joshua A. Banta, Martin H. H Stevens, and Massimo Pigliucci (2010)
  A comprehensive test of the 'limiting resources' framework applied to
  plant tolerance to apical meristem damage.
  \emph{Oikos} \bold{119}(2), 359--369;
  \url{http://dx.doi.org/10.1111/j.1600-0706.2009.17726.x}
}
\examples{
glmer(t.f ~ n + ra + s + (1 | p) +
    (a * n | g), family="poisson",data=Arabidopsis)
}
\keyword{datasets}
