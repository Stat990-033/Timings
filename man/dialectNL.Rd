\name{dialectNL}
\alias{dialectNL}
\docType{data}
\title{
dialectNL data
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("dialectNL")}
\format{
  A data frame with 225866 observations on the following 37 variables.
  \describe{
    \item{\code{G}}{a factor with 559 levels}
    \item{\code{I}}{a factor with levels \code{AC} \code{AG} \code{AJ} \code{AK} \code{AO} \code{AOBB} \code{AR} \code{AV} \code{BB} \code{BH} \code{CA} \code{CZ} \code{DV} \code{DVAV} \code{EH} \code{EM} \code{GK} \code{GKBB} \code{HV} \code{IG} \code{IK} \code{JB} \code{JV} \code{KR} \code{LG} \code{MF} \code{MK} \code{MM} \code{MS} \code{PV}}
    \item{\code{H}}{a factor with 424 levels}
    \item{\code{PronDistStdDutch}}{a numeric vector}
    \item{\code{Y}}{a numeric vector}
    \item{\code{Longitude}}{a numeric vector}
    \item{\code{Latitude}}{a numeric vector}
    \item{\code{U}}{a numeric vector}
    \item{\code{WordFreq.log}}{a numeric vector}
    \item{\code{Z}}{a matrix with 1 columns}
    \item{\code{WordCategory}}{a factor with levels \code{N} \code{A} \code{B} \code{V}}
    \item{\code{A}}{a factor with levels \code{0} \code{1}}
    \item{\code{WordLength.log}}{a numeric vector}
    \item{\code{WordLength.log.z}}{a matrix with 1 columns}
    \item{\code{WordVCratio.log}}{a numeric vector}
    \item{\code{T}}{a matrix with 1 columns}
    \item{\code{PopSize.log}}{a numeric vector}
    \item{\code{PopSize.log.z}}{a matrix with 1 columns}
    \item{\code{PopSize.log_residGeo}}{a numeric vector}
    \item{\code{V}}{a matrix with 1 columns}
    \item{\code{PopAvgIncome.log}}{a numeric vector}
    \item{\code{PopAvgIncome.log.z}}{a matrix with 1 columns}
    \item{\code{PopAvgIncome.log_residGeo}}{a numeric vector}
    \item{\code{X}}{a matrix with 1 columns}
    \item{\code{PopAvgAge}}{a numeric vector}
    \item{\code{PopAvgAge.z}}{a matrix with 1 columns}
    \item{\code{PopAvgAge_residPopAvgIncome.log_Geo}}{a numeric vector}
    \item{\code{W}}{a matrix with 1 columns}
    \item{\code{PopMaleFemaleRatio}}{a numeric vector}
    \item{\code{PopMaleFemaleRatio.z}}{a matrix with 1 columns}
    \item{\code{SpeakerIsMale}}{a numeric vector}
    \item{\code{SpeakerBirthYear}}{a factor with levels \code{1902} \code{1904} \code{1906} \code{1907} \code{1909} \code{1910} \code{1911} \code{1912} \code{1913} \code{1914} \code{1915} \code{1916} \code{1917} \code{1918} \code{1919} \code{1920} \code{1921} \code{1922} \code{1923} \code{1924} \code{1925} \code{1926} \code{1927} \code{1928} \code{1929} \code{1930} \code{1931} \code{1932} \code{1933} \code{1934} \code{1935} \code{1936} \code{1937} \code{1938} \code{1939} \code{1940} \code{1941} \code{1942} \code{1943} \code{1944} \code{1945} \code{1946} \code{1948} \code{1954} \code{1959} \code{1960} \code{1961}}
    \item{\code{SpeakerBirthYear.z}}{a matrix with 1 columns}
    \item{\code{SpeakerEmploymentLevel}}{a factor with levels \code{1} \code{2}}
    \item{\code{SpeakerRecordingYear}}{a factor with levels \code{1979} \code{1980} \code{1981} \code{1982} \code{1983} \code{1984} \code{1985} \code{1986} \code{1986.5} \code{1987} \code{1988} \code{1989} \code{1990} \code{1992} \code{2001}}
    \item{\code{SpeakerRecordingYear.z}}{a matrix with 1 columns}
    \item{\code{FieldworkerIsMale}}{a factor with levels \code{0} \code{0.5} \code{1}}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
lmer(Y ~ U + V +W +X + Z+A + T +(1 | G) +(0 + V + W+ X | G) +(1 + Z + A | H) +(1 | I),REML=FALSE,data=dialectNL)
}
\keyword{datasets}
