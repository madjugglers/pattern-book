
# Nov 5/17

rm( list=ls() )
library(igraph)
library(plotrix)  ## use draw.arc function


# adjacency matrix for ivy-pi

A <- matrix(0, 10, 10 ) ## 10 positions

g <- graph.adjacency(A)

# give edge attributes I think

#ll <- rbind( c(-2,0)+c(2,0),
#	c( -1/2, 1*0.866/2 )+c(2,0),
#        c( 1/2, -1*.866/2)+c(2,0), 
#                              # new 4
#                              # new 5
#        c( 2, 0)+c(2,0),
#        c( 1/2, 1*.866/2)+c(2,0),
#        c( -1/2, -1*.866/2 )+c(2,0),
#                             # new 9
#	                     # new 10
#  )


#pdf( file="ivypi.pdf", height=5, width=5 )

par( mar=rep(1/2,4)  )

#plot( g, layout=ll , 
#	vertex.size=15, edge.arrow.size=1, edge.arrow.width=1, 
#		 edge.lty=1, edge.color="blue", 
#		edge.width=2, vertex.color="magenta", margin=c(0,.4,0,.4), asp=0,
#		rescale=FALSE,
#		edge.curved=c(0,0), xlim=c( )

#symbols( -1/2, 0, circles=1/2, add=TRUE, lwd=2 , inches=FALSE )
#symbols( 1/2, 0, circles=1/2, add=TRUE , lwd=2, inches=FALSE )

plot( 0,0, xlim=c(-3,3), ylim=c(-3,3), axes=FALSE, xlab="", ylab="" )

#symbols( -1, 0, circles=1, add=TRUE, lwd=2, inches=FALSE )
#symbols( 1, 0, circles=1, add=TRUE, lwd=2, inches=FALSE )


draw.arc( -1, 0, angle1=(-pi/3), angle2=pi , lwd=2, col="black" )


# the followin attempt isn't working with curves...maybe just use lines/points

b1 <- sin( pi/3 )/( 1 + cos(pi/3) )
phi <- atan( b1 )  ## which is pi/6
hh <- 2*( sin(pi/3) + cos(pi/3) )
y3 <- -hh*cos( pi/6 )
x3 <-  1+hh*sin(pi/6)
draw.arc( x3, y3, angle1=(pi/3), angle2=(pi) , lwd=2, col="black" )
draw.arc( 1, 0, angle1=0, angle2=(2*pi-2*pi/3) , lwd=2, col="black" )

# flip side
draw.arc( -x3, y3, angle1=(0), angle2=(2*pi/3) , lwd=2, col="black" )

#?
draw.arc( -x3/6, y3, angle1=(pi/3), angle2=(pi) , lwd=2, col="black" )
