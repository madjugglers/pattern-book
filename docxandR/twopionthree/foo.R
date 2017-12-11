
pdf( file="ivypi.pdf", height=5, width=5 )
par( mar=rep(1/2,4)  )
plot( g, layout=ll , 
	vertex.size=15, edge.arrow.size=1/2, edge.arrow.width=2, 
		 edge.lty=1, edge.color="blue", 
		edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
		rescale=FALSE)
symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1/4 , inches=FALSE, col="grey" )
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1/4, inches=FALSE, col="grey" )

plot( g, layout=ll , 
	vertex.size=15, edge.arrow.size=1/2, edge.arrow.width=2, 
		 edge.lty=1, edge.color="blue", 
		edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
		rescale=FALSE, add=TRUE )
dev.off()

A2 <- matrix(0, 10, 10 ) ## 10 positions
A2[1,7] <- 1; A2[7,1] <- 1
A2[6,2] <- 1; A2[2,6] <- 1
A2[4,8] <- 1; A2[8,4] <- 1
A2[3,9] <- 1; A2[9,3] <- 1
g2 <- graph.adjacency(A2)

pdf( file="ivypi-pass.pdf", height=5, width=5 )
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
