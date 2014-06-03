Lab : introduction to counters
project dir : mr-counters

DK API docs : http://docs.oracle.com/javase/7/docs/api/
Hadoop API docs : http://hadoop.apache.org/docs/stable/api/


you can also open the project in eclipse
(use  'mvn eclipse:eclipse'  to create eclipse project files)


== STEP 1) inspect the file with 'bad records'
file : HI-labs/data/billing-data/bad_records.txt
what kind of bad records do you?
  (hint : wrong number of fields,  wrong separator ..etc)


== STEP 2) copy 'bad_recods.txt' file into HDFS
  $ hdfs dfs -mkdir <your name>/billing/in2
  $ hdfs dfs -put ../../data/billing-data/bad_records.txt    <your name>/billing/in2/


== STEP 3) edit the file : src/main/java/hi/mr/Counter.java
complete the TODO items

(Instructor : answer : /labs-solutions/hadoop/mr/mr-counters)


== STEP 4) compile the code:
  $ cd mr-counters
  $ ../compile.sh
this should create a jar file called 'a.jar'


== STEP 5)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.Counter   <your name>/billing/in2/bad_records.txt   <your name>/billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 6)
Once the mr job is done, inspect the output file:
  $ hdfs  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system.


== STEP 7)
inspect the counters
A) by the output produced by MR
B) from job tracker UI
  find the job under 'completed jobs' section
  click on job stats page
  inspect the BAD_RECORDS  counter

also check the console logs, you should see the counter printed out something like this:
    hi.mr.CounterAnswer$MyMapper$Counters
        BAD_RECORDS=5
