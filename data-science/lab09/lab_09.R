# #### #
# 9.1
# #### #
source("lab_09_src.R")
pos_list <- list("good"=1, "great"=2, "excellent"=3, "very good"=4, "fabulous"=4, "fantastic"=5)
neg_list <- list("bad"=1, "terrible"=2, "awful"=3, "very bad"=4, "horrendous"=4, "atrocious"=5)
score_sentiment("This commute is good", pos_list, neg_list)
score_sentiment("This commute is good!!", pos_list, neg_list)
