-- pig-billing-itemized.pig

-- ## TODO : set the name of job
SET job.name 'MY_NAME itemized.pig';

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

-- ## extract customer_id,  resource_id & cost
cid_rid_cost = FOREACH billing_data  GENERATE ....


-- ## group by customer_id and resource_id
grp_by_cid_rid = .....

-- ## then sum cost
total_by_cid_rid = FOREACH grp_by_cid_rid GENERATE group, SUM(....) as total;
DUMP total_by_cid_rid;

-- ## TODO : now process all the files (change LOAD example from sample.txt --> *.log)

-- ## TODO : change MY_NAME / store the file into HDFS
-- STORE total_by_cid_rid INTO 'MY_NAME/billing/out';


