# #### #
# 6.1
# #### #
heights <- c(58,59,60,61,62)
weights <- c(115,117,120,123,126)
my.data <- data.frame(heights,weights)

# #### #
# 6.2
# #### #
my.data <- rbind(my.data, c(60,140))

# #### #
# 6.3
# #### #
rownames(my.data) <- c("A","B","C","D","E","F")

# #### #
# 6.4
# #### #
my.data$BMI <- 703*(my.data$weights/(my.data$heights**2))

# #### #
# 6.5
# #### #
my.data <- my.data[order(-my.data$BMI),]
my.data

# #### #
# 6.6
# #### #
my.data <- my.data[-6,]
my.data

# #### #
# 6.7
# #### #
my.data$BMI <- NULL
my.data

# #### #
# 6.8
# #### #
my.data[c("A","B","D"), "weights"]
