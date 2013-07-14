Introduction

In this lab we are going to test Mahout and see how the
Collaborative Filtering works with a very simple data file.

 
STEP 1) Examine the datafile, called ./cf_intro_data.csv

Q : What are the three fields that the datafile has?
Q : What is the expected delimiter
Q : Is there a provision for comments?

Notice that unlike other components of Mahout, SequenceFiles
are are typically NOT used as input or output.


STEP 2) Ensuring that the mahout command works
On a terminal invoke mahout command
    $ mahout

If successful, you'll get a usage message:

$ mahout
An example program must be given as the first argument.
Valid program names are:

If you get a command not found, you have path issues (or possibly
Mahout is not installed).
You can fix your path in this shell window by using the following command:
$ export PATH=$PATH:/path/to/hbase/location/bin


STEP 3) Make sure JAVA_HOME is set
$ echo $JAVA_HOME

if nothing is there, then set it to the proper JVM you are using.

STEP 4) copy the input to hdfs

$ hadoop fs -copyFromLocal cf_intro_data.csv /user/<yourusername>

or wherever you want the file to live.

Note that if the file already exists there, you will get an error.


STEP 4) Run a simple recommendations job:
bin/mahout recommenditembased --input ./cf_intro_data.csv \
--numRecommendations 2 --output output/ \
--similarityClassname SIMILARITY_PEARSON_CORRELATION

If successful, you will see a series of MapReduce jobs run.

The most common cause of error is undoubtedly an existing temp
or output directory.  You can hadoop fs -rmr those directories
if they exist.

STEP 5) Check out the output

$ hadoop fs -ls output

You should see a part-r-00000 file.

$hadoop fs -cat output/part-r-00000
1	[104:3.9258494]
3	[102:3.2698717]
4	[102:4.7433763]

or something similar. This lists the best recommendations for each user.  

