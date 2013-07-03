Lab : introduction to counters
project dir : mr-counters
you can also open the project in eclipse


STEP 1) inspect the file with 'bad records'
file : data/billing-data/bad_records.txt
what kind of bad records do you?
  (hint : wrong number of fields,  wrong separator ..etc)

STEP 2) copy 'bad_recods.txt' file into HDFS
  $ cd <top of project dir>
  $ hadoop dfs -put data/billing-data/bad_records.txt    <your name>/billing/in/

STEP 3) edit the file : mr-counters/src/hi/mr/Counter.java
STEP 4) complete the TODO items
Answer : mr-counters/src/hi/mr/CounterAnswer.java

STEP 5) compile the code:
  $ cd mr-counters
  $ ../compile2.sh
this should create a jar file called 'a.jar'

STEP 6)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.Counter   <your name>/billing/in/bad_records.txt   <your name>/billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


STEP 6)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../getting-started.txt for detailed instructions)


STEP 7)
inspect the counters
A) by the output produced by MR
B) from job tracker UI
  go to http://<job tracker>:50030
        http://localhost:50030
  find the job under 'completed jobs' section
  click on job stats page
  inspect the BAD_RECORDS  counter

also check the console logs, you should see the counter printed out something like this:
    hi.mr.CounterAnswer$MyMapper$Counters
        BAD_RECORDS=5
