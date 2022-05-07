
# Nov 2/17
# trying to draw some graphs

rm( list=ls() )
library(igraph)


# adjacency matrix for egg-beater with switching handles

A0 <- matrix(0, 8, 8 ) ## 8 positions

A0[1,2] <- 6
A0[2,3] <- 2
A0[3,4] <- 3
A0[4,5] <- 4
A0[5,6] <- 6
A0[6,7] <- 2
A0[7,8] <- 3
A0[8,1] <- 4

A <- 1*(A0>0)

g <- graph.adjacency(A)

# give edge attributes I think

ll <- rbind( c(1.5,2),
             c(1/2,8),
             c(-2,6),
             c(-2,4),
             c(-1.5,2),
             c(-1/2,8),
	     c(2,6),
	     c(2,4) ) 
ll2 <- ll
ll2[,1] <- ll[,1] * 1/2

#set_edge_attr(g, "curved", index=E(g)[1:4], value=.5 )
#set_edge_attr(g, "curved", index=E(g)[5:8], value=.2 )

#plot( g, layout=ll2 , edge.curved=c( rep(-1,4), rep(1,4) ) )

pdf( file="eggbeaterswitching.pdf", height=6, width=6 )
par( mfrow=c(1,2), mar=rep(1,4)  )
plot( g, layout=ll2 , edge.curved=c( -2, 0, 0, 0, 2, 0, 0, 0 ),
	vertex.size=30, edge.arrow.size=1/2, edge.arrow.width=1,
		edge.label=c(6,2,3,4,6,2,3,4), edge.lty=1, edge.color="blue", 
		edge.width=1, vertex.color="magenta", margin=c(0,.4,0,.4) )

A1 <- matrix(0, 8,8 )
A1[1,2] <- 1; A1[2,1] <- 1
A1[5,6] <- 1; A1[6,5] <- 1
A1[3,8] <- 1; A1[8,3] <- 1
A1[4,7] <- 1; A1[7,4] <- 1
g1 <- graph.adjacency(A1)
plot( g1, layout=ll2 , vertex.size=30, edge.color="green", edge.arrow.width=1,
	edge.arrow.size=1/2, edge.width=2, vertex.color="magenta" , margin=c(0,.4,0,.4))


dev.off()
