\name{Socatt}
\alias{Socatt}
\docType{data}
\title{Social Attitudes Survey}
\description{
  These data come from the British Social Attitudes (BSA) Survey started
  in 1983. The eligible persons were all adults aged 18 or over living
  in private households in Britain.  The data consist of completed
  results of 264 respondents out of 410.  
}
\usage{data(Socatt)}
\format{
  A data frame with 1056 observations on the following 9 variables.
  \describe{
    \item{d}{District ID - a factor}
    \item{r}{Respondent code (within district) - a factor}
    \item{y}{A factor with levels \code{1983}, \code{1984},
      \code{1985}, and \code{1986}}
    \item{n}{An ordered factor giving the number of positive answers to
      seven questions.}
    \item{p}{Political party chosen - a factor.  Levels are
      \code{conservative}, \code{labour}, \code{Lib/SDP/Alliance},
      \code{others}, and \code{none}.}
    \item{c}{Self assessed social class - a factor.  Levels are
      \code{middle}, \code{upper working}, and \code{lower working}.}
    \item{g}{Respondent's sex. (1=male, 2=female)}
    \item{a}{Age in years}
    \item{rel}{Religion - a factor.  Levels are \code{Roman
    Catholic}, \code{Protestant/Church of England}, \code{others},
       and \code{none}.}
  }
}
\details{
  These data are provided at \url{http://multilevel.ioe.ac.uk/softrev/}
  as an example of multilevel data with a multinomial response.  Results
  from several multilevel software packages are provided at this site.
}
\source{
  \url{http://multilevel.ioe.ac.uk/softrev/socatt.htm}
}
\references{
  McGrath, K. and Waterton, J. (1986). \emph{British Social Attitudes
    1983-1986 panel survey.} London, Social and Community Planning
  Research.
}
\examples{
str(Socatt)
summary(Socatt)
}
\keyword{datasets}