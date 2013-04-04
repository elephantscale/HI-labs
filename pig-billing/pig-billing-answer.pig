-- pig-billing.pig

-- Parse Input File
billing_data = LOAD '/billing-data/*.log' USING PigStorage(',') AS (timestamp:chararray,custid:chararray,resourceid:chararray,qty:int,cost:int);

billing_data_grouped = GROUP billing_data BY custid;
total_by_customer = foreach billing_data_grouped GENERATE group as custid, COUNT (billing_data.cost) as cost;
STORE total_by_customer INTO 'pig-billing-ouput';
