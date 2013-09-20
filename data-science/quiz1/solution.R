# #### #
# 1.1
# #### #
matrix1 <- matrix(nrow=5, ncol=5)
matrix1[1,] <- c(-1,0,1,1,-1)
matrix1[2,] <- c(1,0,-1,1,-1)
matrix1[3,] <- c(0,1,-1,1,-1)
matrix1[4,] <- c(0,1,-1,-1,-1)
matrix1[5,] <- c(-1,1,-1,-1,-1)

# #### #
# 1.1
# #### #
matrix2 <- matrix1 %*% t(matrix1)
matrix2

# #### #
# 1.3
# #### #
#q1.3 Save matrix2 row-by-row in to a data frame called "df1" with rownames and colnames as
#       "A", "B", "C", "D", and "E"
df1 <- data.frame(matrix2)
rownames(df1) <- c("A","B","C","D","E")
colnames(df1) <- c("A","B","C","D","E")
df1

# #### #
# 1.4
# #### #
plot(df1)

# #### #
# 1.5
# #### #
# B and C are close to each other, D and E are close to each other and A is closer to B than anyone else.
