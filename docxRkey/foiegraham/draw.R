

rm( list=ls() )
library(igraph)


# foie graham

# adjacency matrix for
A <- matrix(0, 24, 24 ) ## 

for( i in 1:11 ){ A[i,i+1] <- 1 }
A[12,1] <- 1
for( i in 13:23 ){ A[i+1,i] <- 1 }
A[13,24] <- 1


g <- graph.adjacency(A)



# give edge attributes I think

aa <- .5*sin(pi/3)
bb <- .5*cos(pi/3)
         
ll0 <- rbind( c(-1,0),
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
 	     c( -.5-bb, -aa) )

dx <- 1
dy <- 1.5
ll <- rbind( ll0, t( t(ll0) + c(-dx,-dy) ) )



lab0 <- as.character( 1:12 )
lab0[4] <- ""
lab0[10] <- "4/10"

bar <- as.character( c(7,6,5,4,3,2,1,12,11,10,9,8) )
tmp <- paste( bar,"'", sep="" )
tmp[4] <- ""
tmp[10] <- "4'/10'"
lab <- c( lab0, tmp )
sz <- 25

pdf( file="foiegraham-positions.pdf", height=6, width=6 )
par( mar=rep(1/2,4)  )

plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=c(-2.25,1.25), xlim=c(-2.25,1.25), 
		vertex.label=lab )

symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1, inches=FALSE , col="grey")

symbols( -1/2-dx, 0-dy, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
symbols( 1/2-dx, 0-dy, circles=1/2, add=TRUE , lwd=1, inches=FALSE , col="grey")

plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, add=TRUE,
		vertex.label=lab )
dev.off()


## make a copy showing passes not moves
##
## 1 -- 1'
##  7' - 11; 7-11'
##  4 - 12'  4'- 12
## 


# adjacency matrix for passing graph

A <- matrix(0, 24, 24 ) ##

A[11,13] <- 1; A[13,11] <- 1
A[12,16] <- 1; A[16,12] <- 1
A[1,19] <- 1; A[19,1] <- 1
A[4,20] <- 1; A[20,4] <- 1
A[7,21] <- 1; A[21,7] <- 1
A[10,16] <- 1; A[16,10] <- 1

g <- graph.adjacency(A)

pdf( file="foiegraham-passes.pdf", height=6, width=6 )
par( mar=rep(1/2,4)  )

plot( g, layout=ll ,
        vertex.size=sz, edge.arrow.size=1/10, edge.arrow.width=1/2,
                 edge.lty=1, edge.color="green",
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=c(-2.25,1.25), xlim=c(-2.25,1.25),
                vertex.label=lab )

symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1, inches=FALSE , col="grey")

symbols( -1/2-dx, 0-dy, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
symbols( 1/2-dx, 0-dy, circles=1/2, add=TRUE , lwd=1, inches=FALSE , col="grey")

plot( g, layout=ll ,
        vertex.size=sz, edge.arrow.size=1/10, edge.arrow.width=1/2,
                 edge.lty=1, edge.color="green",
                edge.width=4, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, add=TRUE, vertex.label=lab )
dev.off()



