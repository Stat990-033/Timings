\name{IncBlk}
\alias{IncBlk}
\title{An unbalanced incomplete block experiment}
\description{
    The \code{IncBlk} data frame has 24 rows and 8 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{G}{
	    an ordered factor giving the block
	}
	\item{A}{
	    a factor with levels \code{1} to \code{4} 
	}
	\item{Y}{
	    a numeric vector
	}
	\item{x}{
	    a numeric vector
	}
    \item{U,V,W,Z}{
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
fit<-lmer(Y~0+A+U+V+W+Z+(1|G),REML=FALSE,data=IncBlk))
}
\keyword{datasets}