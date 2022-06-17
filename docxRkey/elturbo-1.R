

drawit <- function(x,y)
 {
  symbols( x, y+1, circles=1 , lwd=1 , add=TRUE, inches=FALSE)
  symbols( x, y-1, circles=1 , lwd=1 , add=TRUE, inches=FALSE)
 }

jug <- function( x, y, vv, pp=19, cx=1.7 )
 { 
  # x, y are centers of the figure 8
  # vv is a vector over the 8 standard positions, whose in each
  # among 8 standard positions 
  dx <- c(0,1,0,-1,0,1,0,-1)
  dy <- c(2,1,0,-1,-2,-1,0,1)
  for( i in 1:8 )
   {
    if( !is.na(vv[i]) )
     {
      points( x+dx[i], y+dy[i], pch=pp, cex=cx, col=vv[i] )
     }
   }
 }

pass <- function(x,y,i,j,...)
 {
  dx <- c(0,1,0,-1,0,1,0,-1)
  dy <- c(2,1,0,-1,-2,-1,0,1)
  lines( x + dx[c(i,j)] , y+ dy[c(i,j)], lwd=3, col="grey", ... )
 }


pdf( file="el-turbo.pdf" , height=(26/3), width=(18/3) )
par( mar=c(0,0,0,0) )
plot( 0,0, xlim=c(0,18), ylim=c(0,26), type="n", axes=FALSE )

xc <- 3; yc <- 22
drawit( xc, yc )
vv <- c("red", NA, "pink", "green", NA, "blue", "pink", NA )
pass( xc, yc, 1, 6 )
jug( xc, yc, vv )

xc <- 7; yc <- 22
vv <- c("red", NA, NA, "green", "blue", "pink", NA, NA )
drawit( xc, yc )
pass( xc, yc, 1, 4 )
jug( xc, yc, vv )

xc <- 11; yc <- 22
vv <- c("red", NA, "green", "blue", NA ,  "pink", "green", NA )
drawit( xc, yc )
pass( xc, yc, 1, 6 )
jug( xc, yc, vv )

xc <- 15; yc <- 22
vv <- c("red", "green", NA, "blue", "pink",NA, NA, NA )
drawit( xc, yc )
pass( xc, yc, 1, 4 )
pass( xc, yc, 2, 5, lty=2 )
jug( xc, yc, vv )

# 2nd row

xc <- 3; yc <- 16
vv <- c(NA,  "green", "blue", NA, "pink",NA, "blue", "red"  )
drawit( xc, yc )
pass( xc, yc, 2, 5 )
jug( xc, yc, vv )

xc <- 7; yc <- 16
vv <- c( "green", "blue", NA, NA, "pink",NA, NA, "red"  )
drawit( xc, yc )
pass( xc, yc, 5, 8 )
jug( xc, yc, vv )

xc <- 11; yc <- 16
vv <- c( NA, "blue", "red", NA, "pink",NA, "red", "green"  )
drawit( xc, yc )
pass( xc, yc, 5, 2 )
jug( xc, yc, vv )

xc <- 15; yc <- 16
vv <- c( "blue", NA, NA, NA, "pink","red", NA, "green"  )
drawit( xc, yc )
pass( xc, yc, 5, 8 )
pass( xc, yc, 1, 6, lty=2 )
jug( xc, yc, vv )

## row 3

xc <- 3; yc <- 10
vv <- c( "blue", NA, "green",  "pink", NA, "red", "green" ,NA  )
drawit( xc, yc )
pass( xc, yc, 1, 6 )
jug( xc, yc, vv )

xc <- 7; yc <- 10
vv <- c( "blue", NA, NA,  "pink", "red", "green" , NA, NA )
drawit( xc, yc )
pass( xc, yc, 1, 4 )
jug( xc, yc, vv )

xc <- 11; yc <- 10
vv <- c( "blue", NA,  "pink", "red", NA, "green" , "pink", NA )
drawit( xc, yc )
pass( xc, yc, 1, 6 )
jug( xc, yc, vv )

xc <- 15; yc <- 10
vv <- c( "blue",  "pink", NA, "red", "green" , NA, NA, NA )
drawit( xc, yc )
pass( xc, yc, 1, 4 )
pass( xc, yc, 2, 5, lty=2 )
jug( xc, yc, vv )

# last row
xc <- 3; yc <- 4
vv <- c( NA, "pink", "red", NA, "green" , NA, "red", "blue" )
drawit( xc, yc )
pass( xc, yc, 5, 2 )
jug( xc, yc, vv )

xc <- 7; yc <- 4
vv <- c( "pink", "red", NA, NA, "green" , NA, NA, "blue" )
drawit( xc, yc )
pass( xc, yc, 5, 8 )
jug( xc, yc, vv )

xc <- 11; yc <- 4
vv <- c( NA, "red", "blue", NA, "green" , NA, "blue", "pink" )
drawit( xc, yc )
pass( xc, yc, 5, 2 )
jug( xc, yc, vv )

xc <- 15; yc <- 4
vv <- c(  "red", NA, NA, NA, "green",  "blue", NA,  "pink" )
drawit( xc, yc )
pass( xc, yc, 5, 8 )
pass( xc, yc, 1, 6 , lty=2)
jug( xc, yc, vv )









dev.off()
