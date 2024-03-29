% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/potential_ews.R
\name{PlotPotential}
\alias{PlotPotential}
\title{Plot Potential}
\usage{
PlotPotential(
  res,
  title = "",
  xlab.text,
  ylab.text,
  cutoff = 0.5,
  plot.contours = TRUE,
  binwidth = 0.2,
  bins = NULL
)
}
\arguments{
\item{res}{output from movpotential function}

\item{title}{title text}

\item{xlab.text}{xlab text}

\item{ylab.text}{ylab text}

\item{cutoff}{parameter determining the upper limit of potential for visualizations}

\item{plot.contours}{Plot contour lines.}

\item{binwidth}{binwidth for contour plot}

\item{bins}{bins for contour plot. Overrides binwidth if given}
}
\value{
ggplot2 potential plot
}
\description{
Visualization of the potential function from the movpotential function.
}
\examples{
  X = c(rnorm(1000, mean = 0), rnorm(1000, mean = -2), 
  	             rnorm(1000, mean = 2))
       param = seq(0,5,length=3000); 
       res <- movpotential_ews(X, param); 
       PlotPotential(res$res, title = '', 
       	             xlab.text = '', ylab.text = '', 
		     cutoff = 0.5, 
		     plot.contours = TRUE, binwidth = 0.2)
}
\references{
Dakos, V., et al (2012).'Methods for Detecting Early Warnings of Critical Transitions in Time Series Illustrated Using Simulated Ecological Data.' \emph{PLoS ONE} 7(7): e41010. doi:10.1371/journal.pone.0041010
}
\author{
Leo Lahti \email{leo.lahti@iki.fi}
}
