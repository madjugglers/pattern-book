
rm( list=ls() )
library(igraph)

 A <- matrix(0,4,4)
 A[1,2] <- A[2,1] <- 1
 A[2,3] <- A[3,2] <- 1
 A[3,4] <- 1; A[4,3] <- 1
 A[1,4] <- 1; A[4,1] <- 1

 g <- graph.adjacency(A)

 ll <- rbind( c(0,0), c( 0, 1 ), c(1,1), c(1,0) )


 pdf( file="box.pdf" )
 plot(g, layout=ll, xlim=c(-.2,1.2), ylim=c(-.2,1.2),
	edge.arrow.width=0, edge.width=3, vertex.label=c("A","C","B","D"),
	edge.color="green" , rescale=FALSE, vertex.color="yellow",
	vertex.label.cex=3, vertex.size=35 )

 dev.off()
