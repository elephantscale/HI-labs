# #### #
# 5.1
# #### #
list1 <- list()
list1 <- c(list1, fname="Alice", lname="Andrews", phone="111-222-3333", age=22, gender="F")
list1

# #### #
# 5.2
# #### #
names(list1)

# #### #
# 5.3
# #### #
unlist(list1)

# #### #
# 5.4
# #### #
list1$age
list1$gender

# #### #
# 5.5
# #### #
list1 <- c(list1, genderDup=list1$gender)
list1

# #### #
# 5.6
# #### #
list1$genderDup <- NULL
list1

# #### #
# 5.7
# #### #
lapply(list1, class)

# #### #
# 5.8
# #### #
list1 <- list(1,2,3,4)
length(list1)
list2 <- list(1:4)
length(list2)
