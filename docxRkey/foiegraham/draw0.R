

rm( list=ls() )
library(igraph)


# weave, in depth

# adjacency matrix for
A <- matrix(0, 13, 13 ) ## 

for( i in 1:11 ){ A[i,i+1] <- 1 }
A[12,1] <- 1



g <- graph.adjacency(A)

# give edge attributes I think

aa <- .5*sin(pi/3)
bb <- .5*cos(pi/3)
         
ll <- rbind( c(-1,0),
             c(-.5 - bb, aa),
	     c(-.5+bb, aa ),
	     c( 0, 0 ), 
             c( 1/2 -bb, -aa ),
	     c( 1/2 + bb, -aa ),
       	     c( 1, 0),
 	     c( 1/2+ bb, aa ),
	     c(1/2-bb, aa ),
 	     c(0,0),
	     c( -.5+bb, -aa ),
 	     c( -.5-bb, -aa), c( 0, -1.3) )


pdf( file="weavedetail.pdf", height=5, width=5 )
par( mar=rep(1/2,4)  )

lab <- as.character( 1:13 )
lab[4] <- ""
lab[10] <- "4/10"
lab[13] <- "feeder"
sz <- c( rep(16,12), 22 )

plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=c(-1.4,.5),
		vertex.label=lab )

symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1, inches=FALSE , col="grey")

plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, add=TRUE,
		vertex.label=lab )
dev.off()


