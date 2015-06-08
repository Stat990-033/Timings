\name{Gcsemv}
\alias{Gcsemv}
\docType{data}
\title{GCSE exam score}
\description{
  The GCSE exam scores on a science subject. Two components of the exam
  were chosen as outcome variables: written paper and course work. There
  are 1,905 students from 73 schools in England.
}
\usage{data(Gcsemv)}
\format{
  A data frame with 1905 observations on the following 5 variables.
  \describe{
    \item{sch}{School ID - a factor}
    \item{st}{Student ID - a factor}
    \item{g}{Gender of student}
    \item{w}{Total score on written paper}
    \item{c}{Total score on coursework paper}
  }
}
%\details{}
\source{
  \url{http://multilevel.ioe.ac.uk/softrev/gcsemv.html}
}
\references{
  Multivariate response models. (2000). In Rasbash, J., et al, \emph{A
    user's guide to MLwiN}, Institute of Education, University of
  London.
}
\examples{
str(Gcsemv)
}
\keyword{datasets}