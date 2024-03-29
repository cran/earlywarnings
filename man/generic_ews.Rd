% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generic_ews.R
\name{generic_ews}
\alias{generic_ews}
\title{Generic Early Warning Signals}
\usage{
generic_ews(
  timeseries,
  winsize = 50,
  detrending = c("no", "gaussian", "loess", "linear", "first-diff"),
  bandwidth = NULL,
  span = NULL,
  degree = NULL,
  logtransform = FALSE,
  interpolate = FALSE,
  AR_n = FALSE,
  powerspectrum = FALSE
)
}
\arguments{
\item{timeseries}{a numeric vector of the observed univariate timeseries values or a numeric matrix where the first column represents the time index and the second the observed timeseries values. Use vectors/matrices with headings. If the powerspectrum is to be plotted as well, the timeseries lenght should be even number.}

\item{winsize}{is the size of the rolling window expressed as percentage of the timeseries length (must be numeric between 0 and 100). Default is 50\%.}

\item{detrending}{the timeseries can be detrended/filtered prior to analysis. There are four options: gaussian filtering, loess fitting, linear detrending and first-differencing. Default is no detrending.}

\item{bandwidth}{for the Gaussian kernel when gaussian filtering is applied. It is expressed as percentage of the timeseries length (must be numeric between 0 and 100). Alternatively it can be given by the bandwidth selector bw.nrd0 (Default).}

\item{span}{parameter that controls the degree of smoothing (numeric between 0 and 100, Default 25).}

\item{degree}{the degree of polynomial to be used for when loess fitting is applied, normally 1 or 2 (Default).}

\item{logtransform}{logical. If TRUE data are logtransformed prior to analysis as log(X+1). Default is FALSE.}

\item{interpolate}{logical. If TRUE linear interpolation is applied to produce a timeseries of equal length as the original. Default is FALSE (assumes there are no gaps in the timeseries).}

\item{AR_n}{logical. If TRUE the best fitted AR(n) model is fitted to the data. Default is FALSE.}

\item{powerspectrum}{logical. If TRUE the power spectrum within each rolling window is plotted. Default is FALSE.}
}
\value{
\code{\link{generic_ews}} returns a matrix that contains:
  tim the time index.
  ar1 the autoregressive coefficient ar(1) of a first order AR model fitted on the data within the rolling window.
  sd the standard deviation of the data estimated within each rolling window.
  sk the skewness of the data estimated within each rolling window.
  kurt the kurtosis of the data estimated within each rolling window.
  cv the coefficient of variation of the data estimated within each rolling window.
  returnrate the return rate of the data estimated as 1-ar(1) cofficient within each rolling window.
  densratio the density ratio of the power spectrum of the data estimated as the ratio of low frequencies over high frequencies within each rolling window; acf1 the autocorrelation at first lag of the data estimated within each rolling window.
}
\description{
\code{\link{generic_ews}} is used to estimate statistical moments within rolling windows along a timeseries.
}
\details{
In addition, \code{\link{generic_ews}} returns three plots. The first plot contains the original data, the detrending/filtering applied and the residuals (if selected), and all the moment statistics. For each statistic trends are estimated by the nonparametric Kendall tau correlation. The second plot, if asked, quantifies resilience indicators fitting AR(n) selected by the Akaike Information Criterion. The third plot, if asked, is the power spectrum estimated by spec.ar for all frequencies within each rolling window.
}
\examples{
data(foldbif)
out=generic_ews(foldbif,winsize=50,detrending='gaussian',
bandwidth=5,logtransform=FALSE,interpolate=FALSE)
}
\references{
Ives, A. R. (1995). 'Measuring resilience in stochastic systems.' \emph{Ecological Monographs} 65: 217-233

Dakos, V., et al (2008). 'Slowing down as an early warning signal for abrupt climate change.' \emph{Proceedings of the National Academy of Sciences} 105(38): 14308-14312 

Dakos, V., et al (2012).'Methods for Detecting Early Warnings of Critical Transitions in Time Series Illustrated Using Simulated Ecological Data.' \emph{PLoS ONE} 7(7): e41010. doi:10.1371/journal.pone.0041010
}
\author{
Vasilis Dakos \email{vasilis.dakos@gmail.com}
}
\keyword{early-warning}
