\name{WWheat}
\alias{WWheat}
\title{Winter wheat}
\description{
    The \code{WWheat} data frame has 60 rows and 3 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{G}{
	    an ordered factor with 10 levels
	}
	\item{Y}{
	    a numeric vector of yields
	}
	\item{U}{
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
fit<-lmer(Y~1+U+(1+U|G),REML=FALSE,data=WWheat)
}
\keyword{datasets}