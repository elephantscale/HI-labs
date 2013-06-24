Pig Lab : calculate customer total
project dir : pig-billing

Note that this is the same lab as the pig-billing example.

STEP 1) Edit the file billing.pig


STEP 2) complete the TODO items
Answer : pig-billing/billing-answer.pig

STEP 3) Run the pig file using pig:
  $ pig ./billing.pig

STEP 4)
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../lab-notes.txt for detailed instructions)


STEP 5) examine the job stats from job tracker UI
go to  http://<job tracker>:50030
       (e.g. http://localhost:50030)

Find the job under 'completed jobs' section
how many mr jobs were run?
