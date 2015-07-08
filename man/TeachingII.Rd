\name{TeachingII}
\alias{TeachingII}
\title{Teaching Methods II}
\description{
    The \code{TeachingII} data frame has 96 rows and 14 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{m}{
	    a factor with levels \code{1} to \code{3} 
	}
	\item{t}{
	    a factor with levels \code{1} to \code{4}
	}
	\item{g}{
	    a factor with levels \code{f} and \code{m} 
	}
	\item{i}{
	    a numeric vector
	}
	\item{Y}{
	    a numeric vector
	}
	\item{ut}{
	    an ordered factor with levels
	}
    \item{G}{
        a factor for the interaction between "t" and "m"
    }
    \item{A}{
        a factor for the interaction beween "g" and "m"
    }
    \item{U-Z}{
        variables for three way interactiob between "i", "m" and "g"
    }
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.7).
}
\examples{
fit.1<-lmer(Y~1+A+T+U+V+W+X+Z+(1|G),REML=FALSE,data=TeachingII)
}
\keyword{datasets}