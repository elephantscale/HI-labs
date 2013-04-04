Pig Intro Lab : calculate customer total
project dir : pig-intro

STEP 1) start up the GRUNT shell using pig 
$ pig

STEP 2) Practice using the Pig Load Command on the billing data
GRUNT> billing_data = LOAD '/billing-data/*.log' USING PigStorage(',') AS (timestamp:chararray,custid:chararray,resourceid:chararray,qty:int,cost:int); 


STEP 3) Practice using the describe command.
GRUNT > DESCRIBE billing_data; 

STEP 4) Try the same thing but anonymously
GRUNT> billing_data_anon = LOAD 'billing-data/*.log' USING PigStorage(',');
GRUNT> DESCRIBE billing_data_anon

STEP 5) Practice using the DUMP command
GRUNT> DUMP billing_data;

Step 6) use the store commands to store the results.
GRUNT> STORE billing_data INTO pig-intro-out

STEP 6) Check the output
(open a new window or exit pig first)
$ hadoop fs -ls pig-intro-out

STEP 7) 
Once the sample data is working, lets try this on more data.
See ../lab-notes.txt  on how to generate more data and copy it into hdfs


STEP 7)
run mr again on this new data
  $ pig ./pig_billing.pig   billing/in   billing/out2
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
