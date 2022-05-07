
# some code to sketch the octagon weave (1/6/07 by MAN)

weave <- function( xc, yc, angle, width )
   {
    cx <- 2
    cl <- "blue"
    
    x1 <- xc - width * cos( angle )
    x2 <- xc + width * cos( angle )
    y1 <- yc - width * sin( angle )
    y2 <- yc + width * sin( angle )

    points( c(x1,xc,x2), c(y1,yc,y2), pch=19, col=cl, cex=cx ) 
    symbols( c( (x1+xc)/2, (x2+xc)/2 ), y = c( (y1+yc)/2, (y2+yc)/2 ),
		circles = rep( width/2 , 2 ), add=T )
   }

plot( 0,0, type="n", xlim=c(-sqrt(2), sqrt(2) ), ylim=c(-sqrt(2),sqrt(2)),
		axes=F, xlab="", ylab="" )

weave( 0, -1, angle=0, width=.25 )
weave( 1, 0, angle=(pi/2), width=.25 )

