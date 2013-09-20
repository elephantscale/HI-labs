# ### #
# 8.1
# ### #
score_sentiment <- function(docstr,posl,negl) {
    sentiment_score <- 0
    pos_words <- names(posl)
    neg_words <- names(negl)
    print("POSITIVE WORDS : "); print(pos_words)
    print("NEGATIVE WORDS : "); print(neg_words)
    docvec <- strsplit(docstr, " ")[[1]]
    print("DOCUMENT VECTOR : ")
    docvec
    # #### #
    # Positive Matching
    # #### #
    print("Starting Positive Matching :")
    pos_score <- 0
    pos_count <- 0
    for (i in pos_words) {
        pos_occurrences <- grep(i, docvec, value=TRUE)
        if (length(pos_occurrences) > 0) {
            pos_count <- pos_count + length(pos_occurrences)
            print(paste("POS word", i, "found :", length(pos_occurrences), "times"))
            #print(posl[[i]])
            pos_score <- pos_score + as.integer(length(pos_occurrences)*posl[[i]])
            print(paste("Posivite Score is now", pos_score))
        }
    }
    avg_pos_score <- 0.0
    if (pos_count > 0) {
      #print(pos_count)
      avg_pos_score <- as.numeric(pos_score/pos_count)
    }
    print(paste("Average Positive Score is", avg_pos_score))
    # #### #
    # Negative Matching
    # #### #
    print("Starting Negative Matching :")
    neg_score <- 0
    neg_count <- 0
    for (j in neg_words) {
      neg_occurrences <- grep(j, docvec, value=TRUE)
      if (length(neg_occurrences) > 0) {
        neg_count <- neg_count + length(neg_occurrences)
        print(paste("NEG word", j, "found :", length(neg_occurrences), "times"))
        #print(negl[[j]])
        neg_score <- neg_score - (as.integer(length(neg_occurrences)*negl[[j]]))
        print(paste("Negative Score is now", neg_score))
      }
    }
    avg_neg_score <- 0.0
    if (neg_count > 0) {
      #print(neg_count)
      avg_neg_score <- as.numeric(neg_score/neg_count)
    }
    print(paste("Average Negative Score is", avg_neg_score))
    # #### #
    # Sentiment Score Calculation
    # #### #
    sentiment_score <- avg_pos_score + avg_neg_score
    if (sentiment_score != 0.0) {
      if (sentiment_score > 5.0) {
        sentiment_score <- 5.0
      } else if (sentiment_score < -5.0) {
        sentiment_score <- -5.0
      }
    }
    return(sentiment_score)
}
