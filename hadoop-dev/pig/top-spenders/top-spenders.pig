-- top-spenders.pig

-- ## TODO : set the name of job
SET job.name 'MY_NAME top.pig';

-- ## TODO : load billing data, change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

cid_cost = foreach billing_data generate custid, cost;
grp_by_cid = group cid_cost by custid;
total_by_cid = foreach grp_by_cid generate group, SUM(cid_cost.cost) as total;
-- DUMP total_by_cid;

-- ## Now we have total per customer

-- ## TODO : sort the invoice by total
-- sorted = ORDER ....   ;

-- ## TODO : we need top 10
-- top10 = LIMIT ...... ;

-- DUMP top10  ;

-- ## TODO : how many map reduce jobs did this script run?
-- ## can you account for all MR jobs?