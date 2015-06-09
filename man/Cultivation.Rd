\name{Cultivation}
\alias{Cultivation}
\title{Bacterial innoculation applied to grass cultivars}
\description{
    The \code{Cultivation} data frame has 24 rows and 4 columns of data
    from an experiment on the effect on dry weight yield of three
    bacterial inoculation treatments applied to two grass cultivars.
}
\format{
    This data frame contains the following columns:
    \describe{
    \item{b}{
	    a factor with levels \code{1} to \code{4}
	}
	\item{c}{
	    the cultivar factor with levels \code{a} and \code{b}
	}
	\item{i}{
	    the innoculant factor with levels \code{con}, \code{dea} and
	    \code{liv}
	}
	\item{d}{
	    a numeric vector of dry weight yields
	}
    }
}
\source{
    Littell, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 2.2(a)).

    Littel, R. C., Freund, R. J., and Spector, P. C. (1991), \emph{SAS
	System for Linear Models, Third Ed.}, SAS Institute.
}
\examples{
str(Cultivation)
xtabs(~b+c, Cultivation)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with Output 2.10, page 58
  print(fm1Cult <- lmer(d ~ i * c + (1|b) + (1|c),
                          Cultivation))
  print(anova(fm1Cult))
  print(fm2Cult <- lmer(d ~ i + c + (1|b) + (1|c),
                          Cultivation))
  print(anova(fm2Cult))
  print(fm3Cult <- lmer(d ~ i + (1|b) + (1|c), Cultivation))
  print(anova(fm3Cult))
}
}
\keyword{datasets}