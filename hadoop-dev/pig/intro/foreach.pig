-- FOR EACH lab

-- ## TODO : set the name of job
SET job.name 'my_job';

billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

-- ## TODO : lets extract custid and cost
-- A = FOREACH billing_data GENERATE custid, cost;
-- DESCRIBE A;
-- EXPLAIN A;
-- DUMP A;

-- ## TODO : do some manipulation of data
-- B = FOREACH billing_data GENERATE custid, cost*2;
-- DESCRIBE B;
-- DUMP B;
