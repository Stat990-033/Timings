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
	\item{s}{
	    a numeric vector
	}
	\item{ut}{
	    an ordered factor with levels
	}
    \item{tm}{
        a factor for the interaction between "t" and "m"
    }
    \item{gm}{
        a factor for the interaction beween "g" and "m"
    }
    \item{i.f.1-1.m.3}{
        variables for three way interactiob between "i", "m" and "g"
    }
    }
}
%\details{}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.7).
}
\examples{
fit.1<-lmer(s~1+gm+i.f.1+ i.f.2+ i.f.3+ i.m.1+ i.m.2+ i.m.3+(1|tm),REML=FALSE,data=TeachingII)
\keyword{datasets}