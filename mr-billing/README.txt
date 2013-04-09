Lab : calculate customer total
project dir : mr-billing
you can also open the project in eclipse

STEP 1) edit the file : mr-billng/src/hi/mr/BillingTotal.java
STEP 2) complete the TODO items
Answer : mr-billng/src/hi/mr/BillingTotalAnswer.java


STEP 3) compile the code:
  $ cd mr-billing
  $ ../compile.sh
this should create a jar file called 'a.jar'

(before going further, make sure you completed 'hdfs-intro' lab; and copied all the logs into HDFS)

STEP 4)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.BillingTotal   <your name>/billing/in/sample.txt   <your name>/billing/out

STEP 5)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../lab-notes.txt for detailed instructions)


STEP 6)
Once the sample data is working, lets try this on more data.
See ../lab-notes.txt  on how to generate more data and copy it into hdfs


STEP 7)
run mr again on this new data
  $ hadoop jar a.jar  hi.mr.BillingTotal   <your name>/billing/in   <your name>/billing/out2
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
