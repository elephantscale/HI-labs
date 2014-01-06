-- pig-billing.pig

-- ## TODO : set the name of job
SET job.name 'my_job';


-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

-- ## TODO: Find total cost by custid
-- ## first group by customer
-- ## then sum cost

-- ## TODO : now process all the files (change LOAD example from sample.txt --> *.log)

-- ## TODO : store the file into HDFS
-- STORE total_by_customer INTO '<your name>/billing/out';

