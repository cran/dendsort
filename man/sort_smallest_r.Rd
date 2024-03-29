% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sort_smallest_r.R
\name{sort_smallest_r}
\alias{sort_smallest_r}
\title{Sorting and reordering dendrogram nodes by the smallest value in reverse}
\usage{
sort_smallest_r(d)
}
\arguments{
\item{d}{A dendrogram object.\code{d}}
}
\value{
output A sorted dendrogram object.
}
\description{
\code{sort_smallest_r} sorts a dendrogram object in reverse
based on the smallest distance in its subtrees, recursively. 
The cluster with the smallest distance is placed on the right 
side of branch.When a leaf merge with a cluster, the leaf is 
placed on the left side.
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

#sort in reverse, you can also pass hclust object
plot(dendsort(hc, isReverse=TRUE))

#sort by average distance
plot(dendsort(hc, type="average"))

#plot the result
par(mfrow = c(1, 3), mai=c(0.8,0.8,2,0.8))
plot(x, y, col="gray", pch=19, cex=2)
text(x, y, labels=as.character(1:10), cex=0.9)
plot(hc,main="before sorting", xlab="", sub="")
plot(hc_sorted, main="after sorting", xlab="", sub="")

}
\keyword{internal}
