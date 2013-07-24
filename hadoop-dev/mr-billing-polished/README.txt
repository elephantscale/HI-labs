Lab : Polished billing example
project dir : mr-billing-polished

This lab ties up some loose ends in billing MR code and hardens it ready for production


== STEP 1) 
    $  cd mr-billing-polished
    inspect the file : src/hi/mr/BillingPolished.java

Pay attention to 'NOTE' tags.
These specify the changes made


== STEP 2) compile the code:
  $ cd mr-billing-polished
for hadoop 1
  $ ../compile.sh
for hadoop 2
  $ ../compile2.sh

this should create a jar file called 'a.jar'


== STEP 3)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.BillingPolished   <your name>/billing/in   <your name>/billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 4)
Once the mr job is done, inspect the output file:
for hadoop 1
  $ hadoop  dfs -cat <your name>/billing/out/part-r-00000
for hadoop 2
  $ hdfs  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../getting-started.txt for detailed instructions)


== STEP 5)
inspect the counters
A) by the output produced by MR
B) from job tracker UI
  go to http://<job tracker>:50030
        http://localhost:50030
  find the job under 'completed jobs' section
  click on job stats page
