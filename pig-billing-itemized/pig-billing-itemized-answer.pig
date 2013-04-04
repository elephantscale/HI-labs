-- pig-billing-itemized-answer.pig

-- Parse Input File
billing_data = LOAD '/billing-data/*.log' USING PigStorage(',') AS (timestamp:chararray,custid:chararray,resourceid:chararray,qty:int,cost:int);

billing_data_grouped = GROUP billing_data BY (custid,resourceid);
total_by_customer_itemized = foreach billing_data_grouped GENERATE group.custid as custid, group.resourceid as resourceid COUNT (billing_data.cost) as cost;
STORE total_by_customer_itemized INTO 'pig-billing-ouput';
