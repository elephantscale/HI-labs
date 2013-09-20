# 3.1
m1 <- matrix(nrow = 4, ncol = 4)

# 3.2
m1[1,] <- c(1,2,3,4)
m1[2,] <- c(1,3,5,7)
m1[3,] <- c(1,4,7,10)
m1[4,] <- c(1,5,9,13)
m1

# 3.3
col.sums <- apply(m1, 2, sum)
col.sums
m1 <- rbind(m1, col.sums)

# 3.4
row.sums <- apply(m1, 1, sum)
row.sums
m1 <- cbind(m1, row.sums)

# 3.5
rownames(m1) <- c("row1","row2","row3","row4","Sum")

# 3.6
det(m1)

# #### #
# Not invertible as determinant is zero
# #### #
solve(m1)
