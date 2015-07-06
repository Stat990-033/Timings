\name{Alfalfa}
\alias{Alfalfa}
\title{Split-Plot Experiment on Varieties of Alfalfa}
\description{
  The \code{Alfalfa} data frame has 72 rows and 4 columns.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{A}{
      a factor with levels
      \code{Cossack},
      \code{Ladak}, and 
      \code{Ranger} 
    }
    \item{B}{
      a factor with levels
      \code{None} 
      \code{S1} 
      \code{S20} 
      \code{O7} 
    }
    \item{G}{
      a factor with levels \code{A} to \code{F}
    }
    \item{Y}{
      a numeric vector
    }
  }
}
\details{
  These data are described in Snedecor and Cochran (1980) as
  an example of a split-plot design. The treatment structure used in the
  experiment was a 3\eqn{ x }{\times}4 full factorial, with three varieties of
  alfalfa and four dates of third cutting in 1943. The experimental
  units were arranged into six blocks, each subdivided into four plots.
  The varieties of alfalfa (\emph{Cossac}, \emph{Ladak}, and
  \emph{Ranger}) were assigned randomly to the blocks and the dates of
  third cutting (\emph{None}, \emph{S1}---September 1,
  \emph{S20}---September 20, and \emph{O7}---October 7) were randomly
  assigned to the plots.  All four dates were used on each block.
}
\source{
  Pinheiro, J. C. and Bates, D. M. (2000), \emph{Mixed-Effects Models in S
    and S-PLUS}, Springer, New York.  (Appendix A.1)

  Snedecor, G. W. and Cochran, W. G. (1980), \emph{Statistical Methods (7th
    ed)}, Iowa State University Press, Ames, IA
}
\examples{
str(Alfalfa)
(m1 <- lmer(Y ~ A * B + (1|G), Alfalfa, verbose = TRUE))
}
\keyword{datasets}
