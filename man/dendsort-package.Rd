\name{dendsort-package}
\alias{dendsort-package}
\docType{package}
\title{
dendsort package
}
\description{
This package includes functions to sort the hclust or dendrogram object, an output of hierarchical clustering (hclust). The subtrees in the resulting dendrogram are sorted based on the average distance of subtrees at every merging point by default.The other option is to sort based on the smallest distance in the subtree by \code{byAverage=FALSE}. When a leaf merge with a cluster, the leaf is placed on the right side. This sorthing method improves the readability and interpretability of dendrograms and provide more meaningful order of nodes in dendrgram, which consequently affect heatmap viusalization.
}
\details{
\tabular{ll}{
Package: \tab dendsort\cr
Type: \tab Package\cr
Version: \tab 0.1.0\cr
Date: \tab 2014-02-28\cr
License: \tab GPL-2 | GPL-3\cr
}
%%~~ An overview of how to use the package, including the most important functions ~~
The \code{densort} is the main function to reorder a dendrogram or hclust object. By default it orders by the average distance of subtrees from left to right. A dendrogram can be orderd by the smallest distance by passing an argument \code{byAverage=FALSE}. The order of sorting can be reversed by passing an argument \code{isReverse=TRUE}.
There are n! ways to sort n observations. A hierarchical clustering results in n-1 merges, thus resulting 2^n-1 possible reordering at the merging points. Although the default hclust method is deterministic, meaning always resulting in the same dendrogram when the same data set is used, the ordering of agglomerative, or bottom-up, clustering pattern is not clear. Since each merging point can be rotated without affecting the meaning of the hierarchy, the dendrogram can be further sorted to yield a better ordered tree structure. Consequently, this sorting method results more meaningful ordering of columns and/or rows for a coupled heat map visualization.
}
\author{
Ryo Sakai

Maintainer: Ryo Sakai <ryo.sakai@esat.kuleuven.be>
%~~ The author and/or maintainer of the package ~~
}
\references{
forthcoming...
%~~ Literature or other references for background information ~~
}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation ~~
%~~ directory ~~
\keyword{ dendrogram}
\seealso{
\code{\link{dendrogram}, \link{hclust}} in
\code{\link{stats}} package.
}
\examples{
#generate sample data
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(10, mean=rep(1:5, each=2), sd=0.4)
y <- rnorm(10, mean=rep(c(1,2), each=5), sd=0.4)
dataFrame <- data.frame(x=x, y=y, row.names=c(1:10))
#calculate Euclidian distance
distxy <- dist(dataFrame)
#hierachical clustering "complete" linkage by default
hc <- hclust(distxy)

#sort dendrogram
dd <- dendsort(as.dendrogram(hc))
hc_sorted  <- as.hclust(dd)

#plot the result
par(mfrow = c(1, 3), mai=c(0.8,0.8,2,0.8))
plot(x, y, col="gray", pch=19, cex=2)
text(x, y, labels=as.character(1:10), cex=0.9)
plot(hc,main="before sorting", xlab="", sub="")
plot(hc_sorted, main="after sorting", xlab="", sub="")
}
