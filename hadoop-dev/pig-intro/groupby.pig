-- GROUPBY lab
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DUMP billing_data;

-- ## TODO : get a resource grouped
-- grouped_by_resource = GROUP billing_data BY resourceid;
-- DESCRIBE grouped_by_resource
-- DUMP   grouped_by_resource

-- ## TODO : special group - ALL
-- grpd =GROUP billing_data ALL;
-- DESCRIBE grpd;
-- DUMP grpd;
