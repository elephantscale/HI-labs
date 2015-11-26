-- top-spenders.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME top.pig';

-- ## TODO-2: load billing data, change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
cid_cost = foreach billing_data generate custid, cost;
grp_by_cid = group cid_cost by custid;
total_by_cid = foreach grp_by_cid generate group, SUM(cid_cost.cost) as total;
-- dump total_by_cid;

-- ## Now we have total per customer

-- ## TODO-3 : sort the invoice by total
-- sorted = order ....   ;

-- ## TODO-4 : we need top 10
-- top10 = limit ...... ;
-- dump top10  ;

-- ## TODO-5 : how many map reduce jobs did this script run?
-- ## can you account for all MR jobs?