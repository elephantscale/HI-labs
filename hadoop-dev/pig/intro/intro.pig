-- pig-billing.pig

-- ## TODO : set the name of job
SET job.name 'MY_NAME  intro.pig';

-- getting used to LOAD / DESCRIBE / DUMP

-- one line comments start with --
/* this is a mulitline
   comment
*/

-- Parse Input File
-- ## TODO : change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DESCRIBE billing_data;

-- ## TODO : change MY_NAME
billing_data2 = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',');
DESCRIBE billing_data2;

-- ## Save and run the script : 
-- ##      $    pig intro.pig
-- ## Inspect the YARN UI, can you see your job running?
-- ## BREAK : Wait for Instructor

-- ## TODO : explain
-- ## uncomment the following line, run the script, inspect the output
-- EXPLAIN billing_data;

-- ## TODO : DUMP
-- ## uncomment the following line, run the script, inspect the output
-- ## check YARN UI, what do you see now?
-- DUMP billing_data;

-- # now lets store the records in hdfs
-- ## TODO : change MY_NAME
-- STORE billing_data into 'MY_NAME/billing/pigout';
-- # uncomment above line and run the script
-- # inspect the output in HDFS (use  HDFS UI or  'hdfs dfs -ls' & 'hdfs dfs -cat' commands)
-- # is that a file or directory?

-- # what is the field separator in result file?
-- # by default delimiter TAB
-- # lets change it to |
-- ## TODO : update MY_NAME
-- STORE billing_data into 'MY_NAME/billing/pigout2' using PigStorage('|');

