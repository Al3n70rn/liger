% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/functions.R
\name{bulk.gsea}
\alias{bulk.gsea}
\title{Bulk gene set enrichment analysis}
\usage{
bulk.gsea(values, set.list, power = 1, rank = FALSE, weight = rep(1,
  length(values)), n.rand = 10000, mc.cores = 2,
  quantile.threshold = min(100/n.rand, 0.1), return.details = FALSE,
  skip.qval.estimation = FALSE)
}
\arguments{
\item{values}{vector of values with associated gene names; values must be named, according to names appearing in set.list elements}

\item{set.list}{list of gene sets}

\item{power}{an exponent to control the weight of the step (default: 1)}

\item{rank}{whether to use ranks as opposed to values (default: FALSE)}

\item{weight}{additional weights associated with each value (default: rep(1,length(values)))}

\item{n.rand}{number of random permutations used to assess significance (default: 1e4)}

\item{mc.cores}{number of cores for parallel processing (default: 2)}

\item{quantile.threshold}{threshold used (default: min(100/n.rand,0.1))}

\item{return.details}{whether to return extended details (default: FALSE)}

\item{skip.qval.estimation}{whether to skip q-value estimation for multiple testing (default: FALSE)}

\item{plot}{whether to plot (default: TRUE)}

\item{random.seed}{random seed (default: 1)}
}
\description{
Bulk gene set enrichment analysis
}
\examples{
data("org.Hs.GO2Symbol.list")
universe <- unique(unlist(org.Hs.GO2Symbol.list))  # get universe
gs <- org.Hs.GO2Symbol.list[[1]]  # get a gene set
vals <- rnorm(length(universe), 0, 10)  # simulate values
names(vals) <- universe
vals[gs] <- rnorm(length(gs), 100, 10)
gs.list <- org.Hs.GO2Symbol.list # get gene sets
bulk.gsea(values = vals, set.list = gs.list[1:10], mc.cores = 1)
}

