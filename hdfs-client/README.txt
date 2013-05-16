Lab : copy a file from local storage to HDFS
project dir : hdfs-client
you can also open the project in eclipse

STEP 1) edit the file : hdfs-client/src/hi/hdfs/HdfsClientWrite.java
STEP 2) complete the TODO items
Answer : hdfs-client/src/hi/hdfs/HdfsClientWriteAnswer.java

STEP 3) compile the code:
  $ cd hdfs-client
  $ ../compile.sh
this should create a jar file called 'a.jar'

STEP 4)
we will run this jar file
note that the first argument is the local file path, while the second one is the HDFS path

    $ hadoop jar a.jar   hi.hdfs.HdfsClientWrite   ../data/hdfs-data/sample.txt   <user-name>/sample-out.txt


STEP 5)
Inspect the output file:
  $ hadoop  dfs -cat <user-name>/sample-out.txt
or
Browse HDFS file system.  Navigate to '/user/<your user name>/' dir
(see ../lab-notes.txt for detailed instructions)

STEP 6)
Extra credit: exclude non-numeric entries.
This is a standard step of cleaning bad data

NOTE
----

Another possible approach is to use IOUtils.copyBytes()
This is illustrated in the HdfsClientRead.java example
You can re-write the example given here, using this, and discuss your work

STEP 7)
The read lab
edit the hdfs-client/src/hi/hdfs/HdfsClientRead.java
complete the TODO list
answer: hdfs-client/src/hi/hdfs/HdfsClientReadAnswer.java
run
$ hadoop jar a.jar   hi.hdfs.HdfsClientRead   <user-name>/sample-out.txt


