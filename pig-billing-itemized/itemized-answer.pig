-- itemized-answer.pig

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/*.log' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

billing_data_grouped = GROUP billing_data BY (custid,resourceid);
total_by_customer_itemized = foreach billing_data_grouped GENERATE group.custid as custid, group.resourceid as resourceid SUM(billing_data.cost) as total;

STORE total_by_customer_itemized INTO '<your name>/billing/out';
