
# Nov 3/17

rm( list=ls() )
library(igraph)


# adjacency matrix for egg-beater with switching handles

A <- matrix(0, 6, 6 ) ## 6 positions

A[1,2] <- 1
A[2,3] <- 1
A[3,4] <- 1
A[4,5] <- 1
A[5,6] <- 1
A[6,1] <- 1

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


pdf( file="twopionthree-position.pdf", height=5, width=5 )
par( mar=rep(1/2,4)  )

plot( g, layout=ll , 
	vertex.size=15, edge.arrow.size=1/2, edge.arrow.width=2, 
		 edge.lty=1, edge.color="blue", 
		edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
		rescale=FALSE )

symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1/4 , inches=FALSE , col="grey")
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1/4, inches=FALSE , col="grey")

plot( g, layout=ll , 
	vertex.size=15, edge.arrow.size=1/2, edge.arrow.width=2, 
		 edge.lty=1, edge.color="blue", 
		edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
		rescale=FALSE, add=TRUE )
dev.off()



A2 <- matrix(0, 6, 6 ) ## 10 positions
A2[1,3] <- 1; A2[3,1] <- 1
A2[6,4] <- 1; A2[4,6] <- 1
g2 <- graph.adjacency(A2)

pdf( file="twopionthree-pass.pdf", height=5, width=5 )
par( mar=rep(1/2,4)  )
plot( g2, layout=ll ,
        vertex.size=15, edge.arrow.size=1/2, edge.arrow.width=2,
                 edge.lty=1, edge.color="green", 
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE)
symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1/4 , inches=FALSE, col="grey" )
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1/4, inches=FALSE, col="grey" )

plot( g2, layout=ll ,
        vertex.size=15, edge.arrow.size=1/2, edge.arrow.width=2,
                 edge.lty=1, edge.color="green",
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, add=TRUE )
dev.off()
