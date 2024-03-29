% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/potential_ews.R
\name{livpotential_ews}
\alias{livpotential_ews}
\title{Potential Analysis for univariate data}
\usage{
livpotential_ews(
  x,
  std = 1,
  bw = "nrd",
  weights = c(),
  grid.size = NULL,
  detection.threshold = 1,
  bw.adjust = 1,
  density.smoothing = 0,
  detection.limit = 1
)
}
\arguments{
\item{x}{Univariate data (vector) for which the potentials shall be estimated}

\item{std}{Standard deviation of the noise (defaults to 1; this will set scaled potentials)}

\item{bw}{kernel bandwidth estimation method}

\item{weights}{optional weights in ksdensity (used by movpotentials).}

\item{grid.size}{Grid size for potential estimation.}

\item{detection.threshold}{maximum detection threshold as fraction of density kernel height dnorm(0, sd = bandwidth)/N}

\item{bw.adjust}{The real bandwidth will be bw.adjust*bw; defaults to 1}

\item{density.smoothing}{Add a small constant density across the whole observation range to regularize density estimation (and to avoid zero probabilities within the observation range). This parameter adds uniform density across the observation range, scaled by density.smoothing.}

\item{detection.limit}{minimum accepted density for a maximum; as a multiple of kernel height

return \code{livpotential} returns a list with the following elements:
  xi the grid of points on which the potential is estimated
  pot The estimated potential: -log(f)*std^2/2, where f is the density.
  density Density estimate corresponding to the potential.
  min.inds indices of the grid points at which the density has minimum values; (-potentials; neglecting local optima)
  max.inds indices the grid points at which the density has maximum values; (-potentials; neglecting local optima)
  bw bandwidth of kernel used
  min.points grid point values at which the density has minimum values; (-potentials; neglecting local optima)
  max.points grid point values at which the density has maximum values; (-potentials; neglecting local optima)}
}
\description{
\code{livpotential_ews} performs one-dimensional potential estimation derived from a uni-variate timeseries.
}
\examples{
data(foldbif)
res <- livpotential_ews(foldbif[,1])
}
\references{
Livina, VN, F Kwasniok, and TM Lenton, 2010. Potential analysis reveals changing number of climate states during the last 60 kyr . \emph{Climate of the Past}, 6, 77-82.

Dakos, V., et al (2012).'Methods for Detecting Early Warnings of Critical Transitions in Time Series Illustrated Using Simulated Ecological Data.' \emph{PLoS ONE} 7(7): e41010. doi:10.1371/journal.pone.0041010
}
\author{
Based on Matlab code from Egbert van Nes modified by Leo Lahti. Implemented in early warnings package by V. Dakos.
}
\keyword{early-warning}
