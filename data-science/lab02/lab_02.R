odovals <- c(65298, 65593, 65879, 66169, 66466, 66751, 67037, 67318, 67598, 67885)
ododiffs <- diff(odovals)
min(ododiffs)
max(ododiffs)
mean(ododiffs)
var(ododiffs)
sd(ododiffs)
osd1 <- ododiffs[abs(ododiffs - mean(ododiffs)) <= sd(ododiffs)]
gasvals = c(14.96,14.13,14.75,14.984,14.4,14.445,14.3,14.04,14.5,14.8)
gsd1 = gasvals[which(abs(ododiffs - mean(ododiffs)) <= sd(ododiffs))]
sum(osd1/gsd1)/length(osd1)

