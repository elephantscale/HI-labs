-- GROUPBY lab

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME groupby.pig';

-- ## TODO-2 : Load data ;  change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

-- ## TODO-3 : group by resourceid
-- grouped_by_resource = GROUP billing_data BY ???  ;
-- DUMP   grouped_by_resource;
-- DESCRIBE grouped_by_resource;

-- ## TODO-4 : special groupby- ALL
-- grpd = GROUP billing_data ___;
-- DUMP grpd;
-- DESCRIBE grpd;
