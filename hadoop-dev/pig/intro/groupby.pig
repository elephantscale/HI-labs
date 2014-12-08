-- GROUPBY lab

-- ## TODO : set the name of job
SET job.name 'MY_NAME groupby.pig';

-- ## TODO : change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

-- ## TODO : group by resourceid
-- grouped_by_resource = GROUP billing_data BY ???  ;
-- DESCRIBE grouped_by_resource;
-- DUMP   grouped_by_resource;

-- ## TODO : special groupby- ALL
-- grpd = GROUP billing_data ___;
-- DESCRIBE grpd;
-- DUMP grpd;
