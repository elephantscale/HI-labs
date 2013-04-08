Lab : copy a file from local storage to HDFS
project dir : hdfs-client
you can also open the project in eclipse

STEP 1) edit the file : hdfs-client/src/hi/hdfs/HdfsClient.java
STEP 2) complete the TODO items
Answer : hdfs-client/src/hi/hdfs/HdfsClientAnswer.java

STEP 3) compile the code:
  $ cd hdfs-client
  $ ../compile.sh
this should create a jar file called 'a.jar'

STEP 4)
we will run this jar file
note that this is a Java client, not a MR program
also note that the first argument is the local file path, while the second one is the HDFS path
$ hadoop jar hdfs-client/a.jar   hi.hdfs.HdfsClient   data/hdfs-data/sample.txt   hdfs-data/out/sample-out.txt
  

STEP 5)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat hdfs-client/out/sample.txt
or
Browse HDFS file system.  Navigate to '/user/<your user name>/hdfs-client/out' dir
(see ../lab-notes.txt for detailed instructions)
