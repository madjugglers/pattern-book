
## 3-5 Foie Graham

rm( list=ls() )
library(igraph)


# I won't do the full graph, but just one for each side

# foie graham

# feeders
# adjacency matrix for
A <- matrix(0, 12, 12) ## 

for( i in 1:11 ){ A[i,i+1] <- 1 }
A[12,1] <- 1

g <- graph.adjacency(A)

# give node attributes I think

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
 	     c( -.5-bb, -aa) )



lab <- rep("", 12)
lab[c(3,7,11)] <- c("Y","X","Z")

sz <- rep( 21, 12 )
cls <- rep("yellow", 12)
cls[c(10,11,12,1,4,5,6,7) ] <- "pink"

pdf( file="fg35-positions.pdf", height=6, width=6 )
par( mar=rep(1/2,4)  )

plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=2, vertex.color=cls, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=c(-2.25,1.25), xlim=c(-2.0,2.0), 
		vertex.label=lab , vertex.label.cex=3/2,
		vertex.frame.color=NA)

#symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
#symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=1, inches=FALSE , col="grey")

plot( g, layout=ll , 
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=2, vertex.color=cls, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, add=TRUE,
		vertex.label=lab, vertex.label.cex=3/2,
		vertex.frame.color=NA )

## 5-weave part


# feeders
# adjacency matrix for

sz <- rep( 21, 20 )

# give node attributes I think

eps.a <- -pi/2 
eps.b <- eps.a

dy <- 1.5

uu <- (0:4)*(2*pi/5) + eps.a
xx.a  <- .5*cos(uu)
yy.a <- .5*sin(uu) - dy

uu <- (0:4)*(2*pi/5) + eps.b
xx.b  <- .5*cos(uu)
yy.b <- .5*sin(uu) - dy

xxx <- c( rev( xx.b + 1.5), xx.a + .5, rev(xx.a-.5), xx.b-1.5 )
yyy <- c( rev( yy.b ), yy.a, rev(yy.a), yy.b )
ii <- 1:20
ii[c(1,7)] <- ii[c(7,1)] 
xxx <- xxx[ii]
yyy <- yyy[ii]

## labeling

## index
# 1  2  3  4  5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20
# label
# 3 19 20  1  2  17  18   4   5   16   8  14  15   6   7  12  13   9  10  11
A5 <- matrix(0, 20, 20) ##

#A5[4,5] <- 1; A5[5,1] <- 1; A5[1,8] <- 1; A5[8,9] <- 1; A5[9,14] <- 1; A5[14,15] <- 1
#A5[15,11] <- 1; A5[11,18] <- 1; A5[18,19] <- 1; A5[19,20] <- 1; A5[20,16] <- 1
#A5[16,17] <- 1; A5[17,12] <- 1; A5[12,13] <- 1; A5[13,10] <- 1; A5[10,6] <- 1
#A5[6,7] <- 1; A5[7,2] <- 1; A5[2,3] <- 1
#A5[3,4] <- 1

A5[4,5] <- 1; A5[5,7] <- 1; A5[7,8] <- 1; A5[8,9] <- 1; A5[9,14] <- 1; A5[14,15] <- 1
A5[15,11] <- 1; A5[11,18] <- 1; A5[18,19] <- 1; A5[19,20] <- 1; A5[20,16] <- 1
A5[16,17] <- 1; A5[17,12] <- 1; A5[12,13] <- 1; A5[13,10] <- 1; A5[10,6] <- 1
A5[6,1] <- 1; A5[1,2] <- 1; A5[2,3] <- 1
A5[3,4] <- 1

cls <- rep("yellow", 20)
#cls[c(4,7,8,9,11,12,13,20) ] <- "pink"
cls[c(4,1,8,9,11,12,13,20) ] <- "pink"

g5 <- graph.adjacency(A5)



##lab <- c(3, 19, 20, 1,2, 17,18,4,5,16,8,14,15,6,7,12,13,9,10,11)
lab <- rep("", 20)
lab[2] <- "A"
lab[13] <- "C"
lab[20] <- "E"
#lab[1] <- "B"
lab[7] <- "B"
lab[15] <- "D"

## issue with vertex labels 3 and 18 overlapping but wrong color on top
## maybe flip
## 3 and 18 correspond to 1 and 7



#symbols( -3/2, -dy, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
#symbols( -1/2, -dy, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
#symbols( 1/2, -dy, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")
#symbols( 3/2, -dy, circles=1/2, add=TRUE, lwd=1 , inches=FALSE , col="grey")

plot( g5, layout=cbind(xxx,yyy),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="blue", 
                edge.width=2, vertex.color=cls, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE,
		vertex.label=lab, add=TRUE, vertex.label.cex=3/2 ,
		vertex.frame.color=NA )

dev.off()



