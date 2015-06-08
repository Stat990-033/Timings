\name{star}
\alias{star}
\docType{data}
\title{Student Teacher Achievement Ratio (STAR) project data}
\description{
Data from Tennessee's Student Teacher Achievement Ratio (STAR) project
which was  a large-scale, four-year study of the effect of reduced class size.
}
\usage{data(star)}
\format{
  A data frame with 26796 observations on the following 18 variables.
  \describe{
    \item{\code{id}}{a factor - student id number}
    \item{\code{sch}}{a factor - school id number}
    \item{\code{gr}}{grade - an ordered factor with levels \code{K} <
      \code{1} < \code{2} < \code{3}} 
    \item{\code{cltype}}{class type - a factor with levels \code{small},
      \code{reg} and \code{reg+A}.  The last level indicates a regular
      class size with a teachers aide.} 
    \item{\code{hdeg}}{highest degree obtained by the teacher - an
      ordered factor with levels \code{ASSOC} < \code{BS/BA} <
      \code{MS/MA/MEd} < \code{MA+} < \code{Ed.S} < \code{Ed.D/Ph.D}} 
    \item{\code{clad}}{career ladder position of the teacher - a factor
      with levels \code{NOT} \code{APPR} \code{PROB} \code{PEND}
      \code{1} \code{2} \code{3}} 
    \item{\code{exp}}{a numeric vector - the total number of years of
      experience of the teacher}
    \item{\code{trace}}{teacher's race - a factor with levels \code{W},
      \code{B}, \code{A}, \code{H}, \code{I} and \code{O} representing
      white, black, Asian, Hispanic, Indian (Native American) and other}
    \item{\code{read}}{the student's total reading scaled score}
    \item{\code{math}}{the student's total math scaled score}
    \item{\code{ses}}{socioeconomic status - a factor with levels
      \code{F} and \code{N} representing eligible for free lunches or
      not eligible}
    \item{\code{schtype}}{school type - a factor with levels
      \code{inner}, \code{suburb}, \code{rural} and \code{urban}}
    \item{\code{sx}}{student's sex - a factor with levels \code{M} \code{F}}
    \item{\code{eth}}{student's ethnicity - a factor with the same
      levels as \code{trace}}
    \item{\code{birthq}}{student's birth quarter - an ordered factor with
      levels \code{1977:1} < \dots < \code{1982:2}}
    \item{\code{birthy}}{student's birth year - an ordered factor with levels \code{1977:1982}}
    \item{\code{yrs}}{number of years of schooling for the student - a
      numeric version of the grade \code{gr} with Kindergarten
      represented as 0.  This variable was generated from \code{gr} and
      does not allow for a student being retained.}
    \item{\code{tch}}{a factor - teacher id number}
  }
}
\details{
Details of the original data source and the process of conversion to
this representation are given in the vignette.
}
\source{
  \url{http://www.heros-inc.org/data.htm}
}
%\references{}
\examples{
str(star)
}
\keyword{datasets}