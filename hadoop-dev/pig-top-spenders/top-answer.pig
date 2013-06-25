-- pig-billing.pig

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/*.log' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

billing_data_grouped = GROUP billing_data BY custid;
total_by_customer = FOREACH billing_data_grouped GENERATE group as custid, SUM(billing_data.cost) as total;

top = ORDER billing_data_grouped BY total DESC;
STORE top INTO '<your name>/billing/out';

top10 = LIMIT top 10;
