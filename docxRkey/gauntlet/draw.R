
## Gauntlet

rm( list=ls() )
library(igraph)

# maybe a series of graphs

# full graphs
A <- matrix(0, 5, 5) ## 
A[1,4] <- 1; A[4,2] <- 1; A[2,5] <- 1; A[5,3] <- 1

g1 <- graph.adjacency(A)
lab <- c("A","B","C","D","E")

A <- matrix(0, 5, 5) ## 
A[2,4] <- 1; A[4,2] <- 1; A[3,5] <- 1; A[5,3] <- 1
g2 <- graph.adjacency(A)

A <- matrix(0, 5, 5) ## 
A[4,2] <- 1; A[2,5] <- 1; A[5,3] <- 1; A[3,1] <- 1
g3 <- graph.adjacency(A)

A <- matrix(0, 5, 5) ## 
A[1,3] <- 1; A[3,1] <- 1; A[5,2] <- 1; A[2,5] <- 1
g4 <- graph.adjacency(A)

A <- matrix(0, 5, 5) ## 
A[1,4] <- 1; A[2,5] <- 1; A[3,1] <- 1; A[5,3] <- 1
g5 <- graph.adjacency(A)

A <- matrix(0, 5, 5) ## 
A[1,4] <- 1; A[4,1] <- 1; A[3,5] <- 1; A[5,3] <- 1
g6 <- graph.adjacency(A)

# positions
dy <- 1/2

x1 <- c(1,3,5,2,4)
y1 <- 10 + c( rep(dy,3), rep(-dy,2) )

x2 <- c(3.5, 3, 5,2,4)
y2 <- 8 + c( rep(dy,3), rep(-dy,2) ); y2[1] <- 8

x3 <- c(6,3,5,2,4)
y3 <- 6 + c( -dy, dy, dy, -dy, -dy )

x4 <- c(6,3,5,4.5,4)
y4 <- 4 + c( -dy, dy, dy, 0, -dy )

x5 <- c( 6,3,5,7, 4 )
y5 <- 2 + c(-dy,dy,dy,dy,-dy)

x6 <- c(6, 5.5, 5, 7, 4 )
y6 <- c( -dy, 0, dy, dy, -dy )

# colors

cls1 <- rep("pink", 5)
cls1[3] <- "yellow"

cls2 <- rep("pink", 5)
cls2[1] <- "yellow"

cls3 <- rep("pink", 5)
cls3[1] <- "yellow"

cls4 <- rep("pink", 5)
cls4[4] <- "yellow"

cls5 <- cls4

cls6 <- rep("pink", 5)
cls6[2] <- "yellow"


pdf( file="gauntlet.pdf", height=6, width=6 )
par( mar=rep(0,4)  )

xl <- c(-2,8)
yl <- c(-2,11)

sz <- 50
cx <- 1.1
plot( g1, layout=cbind(x1,y1),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="green", 
                edge.width=2, vertex.color=cls1, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=yl, xlim=xl, 
		vertex.label=lab , vertex.label.cex=cx,
		vertex.frame.color=NA)

abline( h=9, col="grey" )

plot( g2, layout=cbind(x2,y2),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="green", 
                edge.width=2, vertex.color=cls2, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=yl, xlim=xl, 
		vertex.label=lab , vertex.label.cex=cx,
		vertex.frame.color=NA, add=TRUE)

abline( h=7, col="grey" )

plot( g3, layout=cbind(x3,y3),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2, 
                 edge.lty=1, edge.color="green", 
                edge.width=2, vertex.color=cls3, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=yl, xlim=xl, 
		vertex.label=lab , vertex.label.cex=cx,
		vertex.frame.color=NA, add=TRUE)

abline( h=5, col="grey" )

plot( g4, layout=cbind(x4,y4),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2,
                 edge.lty=1, edge.color="green",
                edge.width=2, vertex.color=cls4, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=yl, xlim=xl,
                vertex.label=lab , vertex.label.cex=cx,
                vertex.frame.color=NA, add=TRUE)

abline( h=3, col="grey" )

plot( g5, layout=cbind(x5,y5),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2,
                 edge.lty=1, edge.color="green",
                edge.width=2, vertex.color=cls5, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=yl, xlim=xl,
                vertex.label=lab , vertex.label.cex=cx,
                vertex.frame.color=NA, add=TRUE)


abline(h=1, col="grey")



plot( g6, layout=cbind(x6,y6),
        vertex.size=sz, edge.arrow.size=1/2, edge.arrow.width=3/2,
                 edge.lty=1, edge.color="green",
                edge.width=2, vertex.color=cls6, margin=c(0,.4,0,.4), asp=0,
                rescale=FALSE, ylim=yl, xlim=xl,
                vertex.label=lab , vertex.label.cex=cx,
                vertex.frame.color=NA, add=TRUE)


abline(h=-1, col="grey")
abline(h=11, col="grey")

text( rep(-1, 3), c(10,6,2) , "down" )
text( rep(-1, 3), c(8,4,0) , "box" )

text( 3, -2, "...continue..." )

dev.off()
