\name{Semi2}
\alias{Semi2}
\title{Oxide layer thicknesses on semiconductors}
\description{
    The \code{Semi2} data frame has 72 rows and 7 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{A}{
	    a factor with levels \code{1} and \code{2} 
	}
	\item{H}{
	    a factor with levels \code{1} to \code{8}
	}
	\item{w}{
	    a factor with levels \code{1} to \code{3}
	}
	\item{si}{
	    a factor with levels \code{1} to \code{3}
	}
	\item{Y}{
	    a numeric vector
	}
    \item{AH}{
        a factor for the interaction between "l" and"so"
    }
    \item{G}{
        a factor for the interaction between "l" and "w"
    }
    }
}
%\details{}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 4.4).
}
\examples{
str(Semi2)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 4.13, p. 156
  print(fm1Semi2 <- lmer(Y ~ 1 + (1|H)+(1|G), Semi2))
  ## compare with output 4.15, p. 159
  print(fm2Semi2 <- lmer(Y ~ A + (1|H)+(1|G), Semi2))
  print(anova(fm2Semi2))
  ## compare with output 4.17, p. 163
  print(fm3Semi2 <- lmer(Y ~ A + (1|H)+(1|G) + (1|AH),
                         Semi2))
  ## This is not the same as the SAS model.
}
}
\keyword{datasets}