\name{IncBlk}
\alias{IncBlk}
\title{An unbalanced incomplete block experiment}
\description{
    The \code{IncBlk} data frame has 24 rows and 8 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{b}{
	    an ordered factor giving the block
	}
	\item{t}{
	    a factor with levels \code{1} to \code{4} 
	}
	\item{y}{
	    a numeric vector
	}
	\item{x}{
	    a numeric vector
	}
    \item{xt.1-xt.4}{
        Interaction effects for x and different treatment groups
    }
    }
}
\details{
    These data are probably constructed data.
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.5).
}
\examples{
fit<-lmer(y~0+t+xt.1+xt.2+xt.3+xt.4+(1|b),REML=FALSE,data=IncBlk))
}
\keyword{datasets}