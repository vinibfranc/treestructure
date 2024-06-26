% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/m13.R
\name{trestruct}
\alias{trestruct}
\title{Detect cryptic population structure in time trees}
\usage{
trestruct(
  tre,
  minCladeSize = 25,
  minOverlap = -Inf,
  nodeSupportValues = FALSE,
  nodeSupportThreshold = 95,
  nsim = 1000,
  level = 0.01,
  ncpu = 1,
  verbosity = 1,
  debugLevel = 0
)
}
\arguments{
\item{tre}{A tree of type ape::phylo. Must be rooted. If the tree has multifurcations, it will be converted to a binary tree before processing.}

\item{minCladeSize}{All clusters within partition must have at least this many tips.}

\item{minOverlap}{Threshold time overlap required to find splits in a clade}

\item{nodeSupportValues}{Node support values such as produced by bootrap or Bayesian credibility scores. Must be logical or vector with length equal to number of internal nodes in the tree. If numeric, these values should be between 0 and 100.}

\item{nodeSupportThreshold}{Threshold node support value between 0 and 100. Nodes with support lower than this threshold will not be tested.}

\item{nsim}{Number of simulations for computing null distribution of test statistics}

\item{level}{Significance level for finding new split within a set of tips}

\item{ncpu}{If >1 will compute statistics in parallel using multiple CPUs}

\item{verbosity}{If > 0 will print information about progress of the algorithm}

\item{debugLevel}{If > 0 will produce additional data in return value}
}
\value{
A TreeStructure object which includes cluster and partition assignment for each tip of the tree.
}
\description{
Detect cryptic population structure in time trees
}
\details{
Estimates a partition of a time-scaled tree by contrasting coalescent patterns. 
The algorithm is premised on a Kingman coalescent null hypothesis and a test statistic is formulated based on the rank sum of node times in the tree.
If node support values are available (as computed by bootstrap procedures), the method can optionally exclude designation of structure on poorly supported nodes. 
The method will not designate structure on nodes with zero branch length relative to their immediate ancestor.
}
\section{References}{

E.M. Volz, Wiuf, C., Grad, Y., Frost, S., Dennis, A., Didelot, X.D.  (2020) Identification of hidden population structure in time-scaled phylogenies.
}

\examples{
tree <- ape::rcoal(50)
struct <-  trestruct( tree )

}
\author{
Erik M Volz <erik.volz@gmail.com>
}
