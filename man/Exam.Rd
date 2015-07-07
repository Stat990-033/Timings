\name{Exam}
\alias{Exam}
\docType{data}
\title{Exam scores from inner London}
\description{
  Exam scores of 4,059 students from 65 schools in Inner London.
}
\usage{data(Exam)}
\format{
  A data frame with 4059 observations on the following 9 variables.
  \describe{
    \item{G}{School ID - a factor.}
    \item{Y}{Normalized exam score.}
    \item{B}{School gender - a factor.  Levels are \code{mixed},
      \code{boys}, and \code{girls}.}
    \item{U}{Standardised LR test score.}
    \item{A}{Sex of the student - levels are \code{F} and \code{M}.}
  }
}
%\details{}
\source{
  \url{http://multilevel.ioe.ac.uk/softrev/exam.html}
}
\references{
  Goldstein, H., Rasbash, J., et al (1993). A multilevel analysis of
  school examination results. \emph{Oxford Review of Education} 19: 425-433 
}
\examples{
str(Exam)
summary(Exam)
(fm1 <- lmer(Y ~ U + A + B + (1|G), Exam))


}
\keyword{datasets}