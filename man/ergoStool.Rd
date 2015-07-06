\name{ergoStool}
\alias{ergoStool}
\title{Ergometrics experiment with stool types}
\description{
    The \code{ergoStool} data frame has 36 rows and 3 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{Y}{
	    a numeric vector giving the effort (Borg scale) required to
	    arise from a stool
	}
	\item{A}{
	    a factor with levels
	    \code{T1}, 
	    \code{T2}, 
	    \code{T3}, and 
	    \code{T4} giving the stool type
	}
	\item{G}{
	    a factor with levels \code{A} to \code{I}
	}
    }
}
\details{
  Devore (2000) cites data from an article in \emph{Ergometrics} (1993,
  pp. 519-535) on ``The Effects of a Pneumatic Stool and a One-Legged
  Stool on Lower Limb Joint Load and Muscular Activity.''
}
\source{
    Pinheiro, J. C. and Bates, D. M. (2000), \emph{Mixed-Effects Models in S
	and S-PLUS}, Springer, New York.  (Appendix A.9)

    Devore, J. L. (2000), \emph{Probability and Statistics for
      Engineering and the Sciences (5th ed)}, Duxbury, Boston, MA.
}
\examples{
options(show.signif.stars = FALSE)
str(ergoStool)
print(m1 <- lmer(Y ~ A + (1|G), ergoStool), corr = FALSE)
anova(m1)
}
\keyword{datasets}
