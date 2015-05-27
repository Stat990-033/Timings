\docType{data}
\name{Pastes}
\alias{Pastes}
\title{Paste strength by batch and cask}
\format{A data frame with 60 observations on the following 4 variables.
  \describe{
    \item{\code{st}}{paste strength.}
    \item{\code{b}}{delivery batch from which the sample was
      sample.  A factor with 10 levels: \sQuote{A} to \sQuote{J}.}
    \item{\code{c}}{cask within the delivery batch from which the
      sample was chosen.  A factor with 3 levels: \sQuote{a} to
      \sQuote{c}.}
    \item{\code{samp}}{the sample of paste whose strength was assayed,
      two assays per sample. A factor with 30 levels: \sQuote{A:a} to
      \sQuote{J:c}.}
  }}
\source{
  O.L. Davies and P.L. Goldsmith (eds), \emph{Statistical
  Methods in Research and Production, 4th ed.}, Oliver and
  Boyd, (1972), section 6.5
}
\description{
  Strength of a chemical paste product; its quality
  depending on the delivery batch, and the cask within the
  delivery.
}
\details{
  The data are described in Davies and Goldsmith (1972) as
  coming from \dQuote{ deliveries of a chemical paste
  product contained in casks where, in addition to sampling
  and testing errors, there are variations in quality
  between deliveries \dots{} As a routine, three casks
  selected at random from each delivery were sampled and
  the samples were kept for reference. \dots{} Ten of the
  delivery batches were sampled at random and two
  analytical tests carried out on each of the 30 samples}.
}
\examples{
str(Pastes)
require(lattice)
dotplot(c ~ st | reorder(b, st), Pastes,
        strip = FALSE, strip.left = TRUE, layout = c(1, 10),
        ylab = "Cask within batch",
        xlab = "Paste strength", jitter.y = TRUE)
## Modifying the factors to enhance the plot
Pastes <- within(Pastes, b <- reorder(b, st))
Pastes <- within(Pastes, samp <- reorder(reorder(samp, st),
          as.numeric(b)))
dotplot(samp ~ st | b, Pastes,
        strip = FALSE, strip.left = TRUE, layout = c(1, 10),
        scales = list(y = list(relation = "free")),
        ylab = "Sample within batch",
        xlab = "Paste strength", jitter.y = TRUE)
## Four equivalent models differing only in specification
(fm1 <- lmer(st ~ (1|b) + (1|s), Pastes))
(fm2 <- lmer(st ~ (1|b/c), Pastes))
(fm3 <- lmer(st ~ (1|b) + (1|b:c), Pastes))
(fm4 <- lmer(st ~ (1|b/samp), Pastes))
## fm4 results in redundant labels on the sample:batch interaction
head(ranef(fm4)[[1]])
## compare to fm1
head(ranef(fm1)[[1]])
## This model is different and NOT appropriate for these data
(fm5 <- lmer(st ~ (1|b) + (1|c), Pastes))

L <- getME(fm1, "L")
Matrix::image(L, sub = "Structure of random effects interaction in pastes model")
}
\keyword{datasets}