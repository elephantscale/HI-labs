Lab : use distributed cache for lookup data
project dir : mr-distcache-lookup
you can also open this project in eclipse

== STEP 1)
    $  cd mr-distcache-lookup
edit the file : src/hi/mr/BillingLookup.java


== STEP 2) complete the TODO items
Answer : src/hi/mr/BillingLookupAnswer.java


== STEP 3) compile the code:
  $ cd mr-distcache-lookukp
for hadoop 1
  $ ../compile.sh
for hadoop 2
  $ ../compile2.sh
this should create a jar file called 'a.jar'


== STEP 4)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.BillingLookup   <your name>/billing/in/sample.txt   <your name>/billing/out
Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)

QUESTION : Did the job succeed?
QUESTION : Which phase failed, map or reduce?
QUESTION : What was the error?
QUESTION : Why was the task attempted multiple times?

ANSWER : The job should have failed with an error similar to
    error Task Id : attempt_201304021223_0001_r_000000_2, Status : FAILED
    java.io.FileNotFoundException: resource.properties (No such file or directory)
This is b/c we are referring to the 'resource.properties' file in our mr program but it is not available.


== STEP 5)  We are going to run the same code, this time, we are going to use distributed cache to make resource.properties file available
  $ hadoop jar a.jar  hi.mr.BillingLookup -files resource.properties  <your name>/billing/in/sample.txt   <your name>/billing/out2
Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)

QUESTION : Did the job succeed this time?


== STEP 6)
Once the mr job is done, inspect the output file:
for hadoop 1
  $ hadoop  dfs -cat <your name>/billing/out2/part-r-00000
for hadoop 2
  $ hdfs  dfs -cat <your name>/billing/out2/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out2' dir
(see ../getting-started.txt for detailed instructions)

The file should look similar to following:
    1_Memory    117
    1_Snapshot_Backups  64
    1_Unknown   34

Now the output has customer_id, resource name instead of resource_id and total


== STEP 7) inspect Reducer log file to see the loaded resource properties
go to jobtracker UI
        http://<job tracker>:50030
        http://localhost:50030

Click on the latest completed job --> reduce --> reduce task --> logs
You should see something like:
    stdout logs
    ---
    loaded resource mappings:
    {6=Snapshot_Backups, 5=Virtual_Machines, 4=Bandwidth, 3=Disk_IO, 2=Memory, 1=CPU}


== STEP 8)
Once the sample data is working, lets try this on more data.
See ../generating-data.txt  on how to generate more data and copy it into hdfs


== STEP 9)
run mr again on this new data
  $ hadoop jar a.jar  hi.mr.BillingLookup -files resource.properties  <your name>/billing/in   <your name>/billing/out3
note 1 : we are supplying an input dir (not a single file)
note 2 : specified a different output dir


== STEP 10)
inpect the output from HDFS UI
(see ../getting-started.txt for detailed instructions)


BONUS LAB
--------
Can you generate the final reducer output in this format
    customer_id     resource_id, resource_name, total
                 ^             ^
                tab sep      comma sep

HINT : instead of IntWritable as output value type, try Text.  This will let you format the output as we wanted



THINK ABOUT...
--------------
Distributed cache worked here, because the lookup set is pretty small (few 100s of items).  Will this work if we need to lookup millions of records?
For example, if we needed to lookup customer_id --> customer_email.  We could have potentially millions of users.  Will this solution scale?
