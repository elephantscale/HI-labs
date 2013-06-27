-- pig-billing.pig

-- ## TODO : set the name of job
SET job.name 'my_job';

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/*.log' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

billing_data_grouped = GROUP billing_data BY custid;
total_by_customer = FOREACH billing_data_grouped GENERATE group as custid, SUM(billing_data.cost) as total;
STORE total_by_customer INTO '<your name>/billing/out';
