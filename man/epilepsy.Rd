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
    \item{\code{treatment}}{a factor with levels \code{placebo} \code{Progabide}}
    \item{\code{base}}{a numeric vector}
    \item{\code{age}}{a numeric vector}
    \item{\code{seizure.rate}}{a numeric vector}
    \item{\code{period}}{an ordered factor with levels \code{1} < \code{2} < \code{3} < \code{4}}
    \item{\code{subject}}{a factor with levels \code{1} \code{2} \code{3} \code{4} \code{5} \code{6} \code{7} \code{8} \code{9} \code{10} \code{11} \code{12} \code{13} \code{14} \code{15} \code{16} \code{17} \code{18} \code{19} \code{20} \code{21} \code{22} \code{23} \code{24} \code{25} \code{26} \code{27} \code{28} \code{29} \code{30} \code{31} \code{32} \code{33} \code{34} \code{35} \code{36} \code{37} \code{38} \code{39} \code{40} \code{41} \code{42} \code{43} \code{44} \code{45} \code{46} \code{47} \code{48} \code{49} \code{50} \code{51} \code{52} \code{53} \code{54} \code{55} \code{56} \code{57} \code{58} \code{59}}
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
epilepsy.2 <- transform(epilepsy,Visit4=(period==4))
glmer(seizure.rate~log(base)*treatment+Visit4+log(age)+(1|subject),family="poisson",data=epilepsy.2)
}
\keyword{datasets}
