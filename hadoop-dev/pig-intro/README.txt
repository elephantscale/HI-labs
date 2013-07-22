Pig Intro Lab : learning pig concepts
project dir : pig-intro

(Note : before proceeding with the lab, lets make sure we have the data we needed in HDFS : see ../getting-started.txt for instructions)

STEP 1) start up the GRUNT shell using pig
$ pig


STEP 2) Practice using the Pig Load Command on the billing data
GRUNT> billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:chararray,custid:chararray,resourceid:chararray,qty:int,cost:int);


STEP 3) Practice using the describe command.
GRUNT > DESCRIBE billing_data;


STEP 4) Try the same thing but anonymously
GRUNT> billing_data_anon = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',');
GRUNT> DESCRIBE billing_data_anon


STEP 5) Practice using the DUMP command
GRUNT> DUMP billing_data;


Step 6) use the store commands to store the results.
GRUNT> STORE billing_data INTO '<your name>/billing/out';


STEP 7) Check the output
(open a new terminal or exit pig first)
    $ hadoop fs -ls <your name>/billing/out


STEP 8)
examine the job stats from job tracker UI
go to  http://<job tracker>:50030
     (e.g  http://localhost:50030)

Find the job under 'completed jobs' section
Click on it
inspect the stats

STEP 9) we can also run the intro.pig script (exit grunt shell first)
    $ pig  intro.pig


STEP 10) For other labs, follow embedded instructions in pig file
e.g : edit file   foreach.pig
      complete TODOs and save the file
      and run the file as follows
         $   pig foreach.pig


To change the name of pig script supply 'job.name' parameter
    $ pig -Djob.name="hello"  script.pig

---
Turning off logging in pig

create a log.conf file with this line
  log4j.rootLogger=FATAL

invoke pig with -4 arg
  $ pig -4 log.conf   < script.pig
