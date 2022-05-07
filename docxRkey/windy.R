
# Dec 13/17
# trying to windy two-holder

rm( list=ls() )
library(igraph)


A <- matrix(0, 8, 8 ) ## 8 positions

A[1,2] <- 1
A[2,3] <- 1
A[3,4] <- 1
A[4,1] <- 1

A[5,6] <- 1
A[6,7] <- 1
A[7,8] <- 1
A[8,5] <- 1

g <- graph.adjacency(A)


ll <- rbind( 
     c( sqrt(2), 0 ), c( 0, sqrt(2)), c(-sqrt(2),0), c(0,-sqrt(2)), 
     c(1, -1), c(1,1), c(-1,1), c(-1,-1) )
	    

pdf( file="windy.pdf", height=6, width=6 )


plot( g, layout=ll , vertex.size=25, edge.arrow.size=.8, edge.arrow.width=.8,
		 edge.lty=1, edge.color="blue",, 
		edge.width=1, vertex.color=c( rep("magenta",4), rep("yellow",4) ), 
		margin=c(0,.4,0,.4), vertex.label=1:8 )

dev.off()
