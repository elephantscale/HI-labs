Pig Lab : calculate customer total
project dir : pig-billing

Note that this is the same lab as the mr-billing example.

STEP 1) Edit the file pig-billing.pig
STEP 2) complete the TODO items
Answer : mr-bililng/src/pig-billing-answer.pig

STEP 3) Run the pig file using pig:
  $ pig ./pig_billing.pig

STEP 4)
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
