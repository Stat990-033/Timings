\name{Animal}
\alias{Animal}
\title{Animal breeding experiment}
\description{
    The \code{Animal} data frame has 20 rows and 3 columns giving the
    average daily weight gains for animals with different genetic
    backgrounds.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{s}{
	    a factor denoting the sire. (5 levels)
	}
	\item{d}{
	    a factor denoting the dam. (2 levels)
	}
	\item{a}{
	    a numeric vector of average daily weight gains
	}
    \item{ds}{
        a factor for the interaction between sire and dam
    }
    }
}\details{
    This appears to be a constructed data set.
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 6.4).
}
\examples{
fit.1<-lmer(a~1+(1|s)+(1|ds),REML=FALSE,data=Animal)
}
\keyword{datasets}