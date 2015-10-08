-- intro.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME  intro.pig';


-- ## TODO-2 : Load Input File (change MY_NAME)
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DESCRIBE billing_data;

-- ## TODO-3 : Anonymous load (change MY_NAME)
billing_data2 = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',');
DESCRIBE billing_data2;

-- ## Save and run the script : 
-- ##      $    pig intro.pig
-- ## Inspect the YARN UI, can you see your job running?
-- ## BREAK : Wait for Instructor


-- ## TODO-4 : DUMP data out
-- ## uncomment the following line, run the script, inspect the output
-- ## check YARN UI, what do you see now?
-- DUMP billing_data;

-- # now lets store the records in hdfs
-- ## TODO-5 : Store billing_data in HDFS (change MY_NAME)
-- STORE billing_data into 'MY_NAME/billing/pigout';
-- # uncomment above line and run the script
-- # inspect the output in HDFS (use  HDFS UI or  'hdfs dfs -ls' & 'hdfs dfs -cat' commands)
-- # is that a file or directory?

-- # what is the field separator in result file?
-- # by default delimiter TAB
-- # lets change it to |
-- ## TODO-6 : Change separator (update MY_NAME)
-- STORE billing_data into 'MY_NAME/billing/pigout2' using PigStorage('|');

