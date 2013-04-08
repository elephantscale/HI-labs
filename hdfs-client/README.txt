Lab : copy a file from local storage to HDFS
project dir : hdfs-client
you can also open the project in eclipse

STEP 1) edit the file : hdfs-client/src/hi/hdfs/HdfsClient.java
STEP 2) complete the TODO items
Answer : hdfs-client/src/hi/hdfs/HdfsClientAnswer.java

STEP 3) compile the code:
  $ cd mr-billing
  $ ../compile.sh
this should create a jar file called 'a.jar'

STEP 4)
we will run this jar file
note that this is a Java client, not a MR program
also note that the first argument is the local file path, while the second one is the HDFS path
$ java -classpath hdfs-client/a.jar:lib/*:/usr/lib/hadoop/*  hi.hdfs.HdfsClient   data/hdfs-data/sample.txt   hdfs-client/out/sample.txt  

STEP 5)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../lab-notes.txt for detailed instructions)


STEP 6)
Once the sample data is working, lets try this on more data.
See ../lab-notes.txt  on how to generate more data and copy it into hdfs


STEP 7)
run mr again on this new data
  $ hadoop jar a.jar  hi.mr.BillingTotal   billing/in   billing/out2
note 1 : we are supplying an input dir (not a single file)
note 2 : specified a different output dir

STEP 8)
inpect the output from HDFS UI
(see ../lab-notes.txt for detailed instructions)


STEP 9)
examine the job stats from job tracker UI
go to  http://<job tracker>:50030
       http://localhost:50030

Find the job under 'completed jobs' section
Click on it
inspect the stats
