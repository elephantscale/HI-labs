-- TODO : fix <your name>

billing_cleaned = LOAD '<your name>/billing/cleaned' AS (timestamp:long,custid:int,rid:int,qty:int,cost:int);

-- # TODO :  now load customer data, define the schema
-- customers = LOAD '<your name>/billing/customers' USING PigStorage(',')  AS (________);

-- # TODO : join customer & billing using customer_id
-- joined = JOIN ____________;
STORE joined INTO '<your name>/billing/joined';
