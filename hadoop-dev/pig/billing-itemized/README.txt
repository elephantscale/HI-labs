Pig Lab : produce itemized billing statement
project dir : pig-billing-itemized

STEP 1) Edit the file itemized.pig


STEP 2) complete the TODO items
Answer : pig-billing-itemized/itemized-answer.pig

STEP 3) Run the pig file using pig:
  $ pig ./itemized.pig

STEP 4)
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../getting-started.txt for detailed instructions)


STEP 5) examine the job stats from job tracker UI
go to  http://<job tracker>:50030
       (e.g. http://localhost:50030)

Find the job under 'completed jobs' section
how many mr jobs were run?
