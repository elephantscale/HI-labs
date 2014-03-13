-- TODO : fix <your name>

billing_cleaned = LOAD '<your name>/billing/cleaned' AS (timestamp:long,custid:int,rid:int,qty:int,cost:int);

customers = LOAD '<your name>/billing/customers' USING PigStorage(',') AS (custid:int, name:chararray, email:chararray,  state:chararray, discount:int);

joined = JOIN billing_cleaned BY custid,  customers BY custid2;
STORE joined INTO '<your name>/billing/joined';
