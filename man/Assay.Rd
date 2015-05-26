\name{Assay}
\alias{Assay}
\title{Bioassay on Cell Culture Plate}
\description{
    The \code{Assay} data frame has 60 rows and 6 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{b}{
	    an factor with levels \code{A} and \code{B}
	    identifying the block of the well
	}
	\item{s}{
	    a factor with levels \code{a} to \code{f} identifying the
	    sample corresponding to the well
	}
	\item{d}{
	    an ordered factor with levels \code{1} to \code{5}
	    indicating the dilution applied to the well
	}
	\item{l}{
	    a numeric vector of the log-optical density
	}
    \item{bs}{
        a factor with two levels indicating the interaction 
        between factor b and factor s
    }
    \item{bd}{
        a factor with two levels indicating the interaction
        between factor b and factor d
    }
    }
}
\details{
    These data, courtesy of Rich Wolfe and David Lansky from Searle,
    Inc., come from a bioassay run on a 96-well cell culture plate.  The
    assay is performed using a split-block design.  The 8 rows on the
    plate are labeled A--H from top to bottom and the 12 columns on the
    plate are labeled 1--12 from left to right.  Only the central 60 wells
    of the plate are used for the bioassay (the intersection of rows B--G
    and columns 2--11).  There are two blocks in the design: Block A
    contains columns 2--6 and Block B contains columns 7--11. Within each
    block, six samples are assigned randomly to rows and five (serial)
    dilutions are assigned randomly to columns. The response variable is
    the logarithm of the optical density. The cells are treated with a
    compound that they metabolize to produce the stain.  Only live cells
    can make the stain, so the optical density is a measure of the number
    of cells that are alive and healthy.}
\source{
   Pinheiro, J. C. and Bates, D. M. (2000), \emph{Mixed-Effects Models in S
     and S-PLUS}, Springer, New York. (Appendix A.2)
}
\examples{
str(Assay)
m1 <- lmer(l ~ s * d + (1|b) + (1|bs) +
           (1|bd), Assay, verbose = TRUE)
print(m1, corr = FALSE)
anova(m1)
m2 <- lmer(l ~ s + d + (1|b) + (1|bs) +
           (1|bd), Assay, verbose = TRUE)
print(m2, corr = FALSE)
anova(m2)
m3 <- lmer(l ~ s + d + (1|b) + (1|bs),
           Assay, verbose = TRUE)
print(m3, corr = FALSE)
anova(m3)
anova(m2, m3)
}
\keyword{datasets}
