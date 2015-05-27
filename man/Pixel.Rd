\name{Pixel}
\alias{Pixel}
\title{X-ray pixel intensities over time}
\description{
    The \code{Pixel} data frame has 102 rows and 5 columns of data on the
    pixel intensities of CT scans of dogs over time
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{d}{
	    a factor with levels \code{A} to \code{J} designating the dog
	    on which the scan was made
	}
	\item{s}{
	    a factor with levels \code{L} and \code{R} designating the side
	    of the dog being scanned
	}
	\item{day}{
	    a numeric vector giving the day post injection of the contrast
	    on which the scan was made
	}
	\item{p}{
	    a numeric vector of pixel intensities
	}
    \item{ds}{
        a factor with 20 levels for the interaction effect between d and s
    }
    }
}
\source{
    Pinheiro, J. C. and Bates, D. M. (2000) \emph{Mixed-effects Models in
	S and S-PLUS}, Springer.
}
\examples{
options(show.signif.stars = FALSE)
str(Pixel)
summary(Pixel)
(fm1 <- lmer(pixel ~ day + I(day^2) + (1|Dog:Side) + (day|Dog), Pixel))
}
\keyword{datasets}
