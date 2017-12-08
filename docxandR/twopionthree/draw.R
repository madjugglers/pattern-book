
# Nov 3/17

rm( list=ls() )
library(igraph)


# adjacency matrix for egg-beater with switching handles

A <- matrix(0, 6, 6 ) ## 6 positions

#A[1,2] <- 1
#A[2,3] <- 1
#A[3,4] <- 1
#A[4,5] <- 1
#A[5,6] <- 1
#A[6,1] <- 1

g <- graph.adjacency(A)

# give edge attributes I think

p1 <- c( -1, 0)
p2 <- c( cos( pi/3 ) , sin( pi/3 ) )
p3 <- c( cos( pi/3 ) , -sin( pi/3 ) )

#ll <- rbind(  c(-1,0)+p1,
#	      c(-1,0)+p2,
#              c(2,0)-p2,
#              c(2,0)-p1,
#              c(2,0)-p3,
#	      c(-1,0)+p3) 
            
ll <- rbind( c(-1,0),
	c( -1/4, 1*0.866/2 ),
        c( 1/4, -1*.866/2), 
        c( 1, 0),
        c( 1/4, 1*.866/2),
        c( -1/4, -1*.866/2 ) )


pdf( file="twopionthree.pdf", height=5, width=5 )

par( mar=rep(1/2,4)  )

plot( g, layout=ll , 
	vertex.size=15, edge.arrow.size=1, edge.arrow.width=1, 
		 edge.lty=1, edge.color="blue", 
		edge.width=2, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
		rescale=FALSE,
		edge.curved=c(0,0) )

symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=2 , inches=FALSE )
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=2, inches=FALSE )

plot( g, layout=ll , 
	vertex.size=15, edge.arrow.size=1, edge.arrow.width=1, 
		 edge.lty=1, edge.color="blue", 
		edge.width=2, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
		rescale=FALSE,
		edge.curved=c(0,0) , add=TRUE )


dev.off()
