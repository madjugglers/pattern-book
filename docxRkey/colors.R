
# a look at color swapping in interlocking turbo

# 18 clubs; 9 red, 9 white say

clubs <- c( paste( rep("R",9), 1:9, sep="-"), 
	    paste( rep("W",9), 1:9, sep="-" ) )

## the 18 positions are in hands of 6 jugglers....3 start red on left [from my position]
## (the move-behinder's and hard-turners) and 3 on right (the move-in-fronters and easy
## turners)

# I worked out in 10/13/16 notebook what the position transformation is after 9 passing
# beats
#          1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 
tran <- c(12,11,15,13,16,17, 1, 5, 9, 3, 2, 6, 4, 7, 8,10,14,18)

ot <- order(tran)  ## where the clubs are after 9 beats, one 1/2 cycle

print( matrix(clubs,3,6) )

clubs2 <- clubs[ot] ;  print("2"); print( matrix(clubs2,3,6) )
clubs3 <- clubs2[ot] ; print("3"); print(  matrix(clubs3,3,6) )
clubs4 <- clubs3[ot] ; print("4");  print( matrix(clubs4,3,6) )
clubs5 <- clubs4[ot] ; print("5"); print( matrix(clubs5,3,6) )
clubs6 <- clubs5[ot] ; print("6"); print( matrix(clubs6,3,6) )
clubs7 <- clubs6[ot] ; print("7"); print( matrix(clubs7,3,6) ) ## !!!

## each column holds the three clubs of a juggler (a,b,c,alpha,beta,gamma) for the two
## weaves.   Wow...after 7 half cycles = 63 rights we're back to the initial club
## configuration
