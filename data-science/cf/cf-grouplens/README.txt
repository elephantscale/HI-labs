Introduction

In this lab we will make use of a larger dataset from a publicly
accessible source: the GroupLens dataset.

 
STEP 1) Download the GroupLens dataset

Go to the following url: http://www.grouplens.org/node/73
Download the 1M Grouplens dataset.

When downloaded, unzip the dataset

$ unzip ./ml-1m.zip
$ cp ml-1m/ratins.dat /path/to/your/lab/working/dir

STEP 2) Convert the GroupLens dataset to something Mahout/Taste
can use:

$ cat ratings.dat | sed -e s/::/,/g| cut -d, -f1,2,3 > cf-grouplens.csv 

STEP 3) copy the input to hdfs

$ hadoop fs -copyFromLocal cf-gropulens.csv /user/<yourusername>/cf_grouplens

or wherever you want the file to live.

Note that if the file already exists there, you will get an error.


STEP 4) create a 90% percent training set and a 10% probe set
mahout splitDataset --input cf-grouplens/cf-grouplens.csv --output cf-grouplens//dataset \
    --trainingPercentage 0.9 --probePercentage 0.1 --tempDir cf-grouplens/dataset/tmp

This splits the dataset into a training portion and a other portion.

STEP 5) run distributed ALS-WR to factorize the rating matrix defined by the training set
mahout parallelALS --input cf-grouplens/dataset/trainingSet/ --output cf-grouplens/als/out \
    --tempDir cf-grouplens/als/tmp --numFeatures 20 --numIterations 10 --lambda 0.065 --numThreadsPerSolver 2


STEP 6) compute predictions against the probe set, measure the error
mahout evaluateFactorization --input cf-grouplens/dataset/probeSet/ --output cf-grouplens/als/rmse/ \
    --userFeatures cf-grouplens/als/out/U/ --itemFeatures cf-grouplens/als/out/M/ --tempDir cf-grouplens/als/tmp

STEP 7) compute recommendations
mahout recommendfactorized --input cf-grouplens/als/out/userRatings/ --output cf-grouplens/recommendations/ \
    --userFeatures cf-grouplens/als/out/U/ --itemFeatures cf-grouplens/als/out/M/ \
    --numRecommendations 6 --maxRating 5 --numThreads 2

STEP 8) View Recommendations
hadoop fs -cat cf-grouplens/recommendations/part-m-00000 |head


or something similar. This lists the best recommendations for each user.  

