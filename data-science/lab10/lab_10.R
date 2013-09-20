ratings <- matrix(nrow=5, ncol=3)
colnames(ratings) <- c("SS", "Ti", "T2")
rownames(ratings) <- c("A", "B", "C", "D", "E")
ratings[1,] <- c(5,5,3)
ratings[2,] <- c(1,3,5)
ratings[3,] <- c(3,5,4)
ratings[4,] <- c(2,3,5)
ratings[5,1] <- 2
ratings[5,2] <- 4
dist(ratings)
1/(1+dist(ratings))
