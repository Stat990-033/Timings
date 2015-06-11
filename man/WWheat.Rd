\name{WWheat}
\alias{WWheat}
\title{Winter wheat}
\description{
    The \code{WWheat} data frame has 60 rows and 3 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{v}{
	    an ordered factor with 10 levels
	}
	\item{y}{
	    a numeric vector of yields
	}
	\item{m}{
	    a numeric vector of soil moisture contents
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 7.2).
}
\examples{
fit<-lmer(y~1+m+(1+m|v),REML=FALSE,data=WWheat)
}
\keyword{datasets}