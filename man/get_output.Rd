\name{get_output}

\alias{get_output}

\title{Import samplesim simulation results}

\description{
This function imports samplesim simulation results. More specifically it loads the median and width of credible intervals.
}

\usage{
get_output(name = "simulation_1", change = FALSE, reference = NULL)
}

\arguments{
\item{name}{Name of the simulation to plot results.}
\item{change}{If TRUE, values are expressed as a percentage of change.}
\item{reference}{The reference state to compute percentage of change. Default is the minimum value of sample size.}
}

\value{
A data frame with five columns:
\item{replicate}{The number of replicate.}
\item{source}{The source name.}
\item{size}{The sample size.}
\item{value}{The value of medians/widths of credible intervals.}
\item{type}{The label of value (i.e. medians or widths)}
If 'change' is TRUE, then the column replicate is omitted and results are aggregated over replicates.
}

\references{
Lecomte N.,Ehrich D., Casajus N., Berteaux D., Giroux M.-A., Yoccoz N.G. How many is enough? sample size and the outcome of stable isotope mixing models. Submitted in Methods in Ecology and Evolution.
}

\author{
Nicolas Casajus, Nicolas Lecomte, Dorothee Ehrich
}

\seealso{
\code{\link{samplesim}}, \code{\link{plot_samplesim}}
}

\examples{
# Load datasets
data(dataPrey)
data(dataConsumer)

# Effect of sample size by modifying source 4
samplesim(
  dataConsumer,
  dataPrey,
  type = "one source",
  nsamples = c(5, 10, 25),
  nrep = 10,
  modwhich = 4,
  name = "sim_1")

# Import results
res <- get_output(name = "sim_1")

# Print results
head(res, 10)

# Import results (percentage of change)
res <- get_output(name = "sim_1", change = TRUE, reference = 5)

# Print results
head(res, 10)
}