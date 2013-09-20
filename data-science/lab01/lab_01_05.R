# Initialize the outer loop variable
i = 0
while ( i < 50 ) {
    i = i + 1
    # 1 is not prime
    if (i == 1) next
    # j is the inner loop variable
    j = as.integer(sqrt(i))
    # Check if there are more than one divisors
    if (j == 1) {
        print(sprintf("%d is prime",i))
        next
    }
    #sprintf("i = '%d', j = '%d'",i,j)
    divisor_found = FALSE
    k = 1
    repeat {
        k = k + 1
        if (k > j) break
        if ((i %% k) == 0) {
            divisor_found = TRUE
            break
        }
    }
    if (!divisor_found) {
        print(sprintf("%d is prime",i))
    }
}
