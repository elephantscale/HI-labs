-- pig-billing.pig

-- ## TODO : set the name of job
SET job.name 'my_job';

-- getting used to LOAD / DESCRIBE / DUMP

-- one line comments start with --
/* this is a mulitline
   comment
*/

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DESCRIBE billing_data;

billing_data2 = LOAD '<your name>/billing/in/*.log' USING PigStorage(',');
DESCRIBE billing_data2;

-- DUMP billing_data;
-- # now uncomment  DUMP above.  Run the script again.
-- # what is the output?  check the JT page see any MR jobs ran

-- # now lets store the records in hdfs
-- STORE billing_data into '<your name/billing/out';
-- # uncomment above line and run the script
-- # check out 'logs/out' in HDFS
-- # is that a file or directory?

-- # what is the field seperator in result file?
-- # by defautl is it TAB
-- # lets change it to |
-- STORE billing_data into '<your name>/billig/out2' using PigStorage('|');


