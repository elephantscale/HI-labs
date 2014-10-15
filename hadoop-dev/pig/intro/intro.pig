-- pig-billing.pig

-- ## TODO : set the name of job
SET job.name 'your_name  intro.pig';

-- getting used to LOAD / DESCRIBE / DUMP

-- one line comments start with --
/* this is a mulitline
   comment
*/

-- Parse Input File
-- ## TODO : change <your name>
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DESCRIBE billing_data;

-- ## TODO : change <your name>
billing_data2 = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',');
DESCRIBE billing_data2;

-- ## BREAK : Wait for Instructor
-- ## TODO : explain
-- ## uncomment the following line, run the script, inspect the output
-- EXPLAIN billing_data;

-- ## TODO : DUMP
-- ## uncomment the following line, run the script, inspect the output
-- ## check YARN UI, what do you see?
-- DUMP billing_data;

-- # now lets store the records in hdfs
-- ## TODO : change <your name>
-- STORE billing_data into '<your name>/billing/pigout';
-- # uncomment above line and run the script
-- # inspect the output in HDFS (use  HDFS UI or  'hdfs dfs -ls' & 'hdfs dfs -cat' commands)
-- # is that a file or directory?

-- # what is the field separator in result file?
-- # by default delimiter TAB
-- # lets change it to |
-- ## TODO : update <your name>
-- STORE billing_data into '<your name>/billing/pigout2' using PigStorage('|');

