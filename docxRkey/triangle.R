
rm( list=ls() )
library(igraph)

 A <- matrix(0,3,3)
 A[1,2] <- A[2,1] <- 1
 A[2,3] <- A[3,2] <- 1
 A[3,1] <- 1; A[1,3] <- 1
 g <- graph.adjacency(A)

 ll <- rbind( c(-1,0), c( 0, sqrt(3) ), c(1,0) )


 pdf( file="triangle.pdf" )
 plot(g, layout=ll, xlim=c(-1.2,1.2), ylim=c(-.2,2),
	edge.arrow.width=0, edge.width=3, vertex.label=c("C","A","B"),
	edge.color="green" , rescale=FALSE, vertex.color="yellow",
	vertex.label.cex=3, vertex.size=45 )

 dev.off()
