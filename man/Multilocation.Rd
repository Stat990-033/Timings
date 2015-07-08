\name{Multilocation}
\alias{Multilocation}
\title{A multilocation trial}
\description{
  The \code{Multilocation} data frame has 108 rows and 7 columns.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{o}{a numeric vector }
    \item{G}{
      an ordered factor with levels
      \code{B} < \code{D} < \code{E} < \code{I} < \code{G} <
      \code{A} < \code{C} < \code{F} < \code{H}
    }
    \item{H}{a \code{\link{factor}} with levels \code{1} to \code{3} }
    \item{A}{a factor with levels \code{1} to \code{4} }
    \item{Y}{ a numeric vector }
    \item{f}{ a numeric vector }
    \item{g}{ an \code{\link{ordered}} factor with levels
      \code{B/1} < \code{B/2} < \code{B/3} < \code{D/1} <
      \code{D/2} < \code{D/3} < \code{E/1} < \code{E/2} <
      \code{E/3} < \code{I/1} < \code{I/2} < \code{I/3} <
      \code{G/1} < \code{G/2} < \code{G/3} < \code{A/1} <
      \code{A/2} < \code{A/3} < \code{C/1} < \code{C/2} <
      \code{C/3} < \code{F/1} < \code{F/2} < \code{F/3} <
      \code{H/1} < \code{H/2} < \code{H/3}
    }
  }
}
\source{
  Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
  R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
  (Data Set 2.8.1).
}
\examples{%% same is in vignette -- keep in sync ! -- ../vignettes/Usinglmer.Rnw
str(Multilocation)
lmer(Y ~ 1 + A + (0+A|G) + (1|H),REML=FALSE,data=Multilocation)
}
\keyword{datasets}