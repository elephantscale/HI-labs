# #### #
# 7.1
# #### #
plot(mtcars$mpg,mtcars$disp,main="MPG vs. Displacement",sub="Fig. 7.1",xlab="Displacement",ylab="Miles per Gallon")

# #### #
# 7.2
# #### #
boxplot(mpg~cyl, data=mtcars, xlab="Cylinders", ylab="MPG", sub="Fig. 7.2")

# #### #
# 7.3
# #### #
abline(h=mean(mtcars$mpg), col="red")
