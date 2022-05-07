
## egg-beater twister
## everyone moves

rm( list=ls() )
library(igraph)

# full graph
A <- matrix(0, 29, 29) ## 
# first 12=weave; next 8x2 = egg beaters; last = olive

# weave
for( i in 1:11 ){ A[i+1,i] <- 1 }
A[1,12] <- 1
A[12,11] <- 0
A[12,18] <- 1
A[17,11] <- 1
A[6,23] <- 1
A[6,5] <- 0

# left beater
for( i in 13:19 ){  A[i,i+1] <- 1  }
A[20,13] <- 1
A[17,18] <- 0

# right beater
for( i in 21:27 ){  A[i,i+1] <- 1  }
A[28,21] <- 1

A[22,23] <- 0
A[22,5] <- 1

g <- graph.adjacency(A)

B <- matrix(0, 29, 29) ## 
B[4,29] <- 1
B[21,7] <- 1
B[16,1] <- 1
B[18,25] <- 1
B[20,23] <- 1

g2 <- graph.adjacency(B)

# give node attributes I think

aa <- .5*sin(pi/3)
bb <- .5*cos(pi/3)
         
# weave nodes

ll.w <- rbind( c(-1,0),
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


th <- seq(0, 2*pi*7/8, length=8 )
aa <- (4/3)*1/3
bb <- (4/3)*1/2 
rad <- aa*bb/sqrt( aa^2 * (sin(th))^2 + bb^2 *(cos(th))^2 )
x0 <- rad*cos(th)
y0 <- rad*sin(th)

# left beater
ll.lb <- cbind( rev(x0)-2/3, rev(y0)-3/2 )

# right beater
ll.rb <- cbind( (x0)+2/3, (y0)-3/2 )

ll <- rbind( ll.w, ll.lb, ll.rb, c(0,1) )
lab <- rep("", 29)

sz <- rep( 23, 29 )
cls <- rep("yellow", 29)
cls[c(1,4,7,10,16,18,20,21,23,25)] <- "pink"
cls[29] <- "pink"

pdf( file="ebt-move.pdf", height=6, width=6 )
par( mar=rep(1/2,4)  )

cx <- 1.1
plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=2, vertex.color=cls, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=c(-2.25,1.25), xlim=c(-2.0,2.0), 
		vertex.label=lab , vertex.label.cex=cx,
		vertex.frame.color=NA)

lab[29] <- "A"
lab[1] <- "B"
lab[16] <- "F"
lab[20] <- "E"
lab[23] <- "G" 
lab[27] <- "H"
lab[5] <- "C"
lab[9] <- "D"
plot( g2, layout=ll ,  add=TRUE ,
        vertex.size=sz, edge.arrow.size=0, edge.arrow.width=0, 
                 edge.lty=1, edge.color="green", 
                edge.width=3, vertex.color=cls, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=c(-2.25,1.25), xlim=c(-2.0,2.0), 
		vertex.label=lab , vertex.label.cex=cx,
		vertex.frame.color=NA)



dev.off()
