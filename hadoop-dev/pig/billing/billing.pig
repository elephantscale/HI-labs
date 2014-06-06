-- pig-billing.pig

-- Pig Latin reference : http://pig.apache.org/docs/r0.11.1/basic.html

-- ## TODO : set the name of job
SET job.name 'my_job';


-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

-- ## extract customer_id & cost
-- cid_cost = FOREACH billing_data  GENERATE ....
-- DESCRIBE cid_cost;


-- ## group by customer
-- grp_by_cid = .....
-- DESCRIBE grp_by_cid;

-- ## then sum cost
-- total_by_cid = FOREACH grp_by_cid GENERATE group, SUM(....) as total;
-- DUMP total_by_cid;

-- ## TODO : now process all the files (change LOAD example from sample.txt --> *.log)

-- ## TODO : store the file into HDFS
-- STORE total_by_cid INTO '<your name>/billing/out';

