-- TODO : fix <your name>

billing_raw = LOAD '<your name>/billing/raw/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:int,rid:int,qty:int,cost:int);

-- # TODO : filter where cost > 0, and save to HDFS
-- billing_cleaned =  FILTER...
-- DUMP billing_cleaned;
-- STORE billing_cleaned INTO '<your name>/billing/cleaned';
