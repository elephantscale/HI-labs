-- TODO : fix <your name>

billing_raw = LOAD '<your name>/billing/raw/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:int,rid:int,qty:int,cost:int);

billing_cleaned =  FILTER billing_raw BY cost > 0;
-- DUMP billing_cleaned;
STORE billing_cleaned INTO '<your name>/billing/cleaned';
