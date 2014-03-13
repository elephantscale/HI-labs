-- TODO : fix <your name>

billing_customer = LOAD '<your name>/billing/joined' AS (timestamp:long, custid:int, rid:int, qty:int, cost:int, custid2:int,  custname:chararray,  email:chararray,  state:chararray,  discount:int);

A = FOREACH billing_customer GENERATE state, cost;

B = GROUP A BY state;

C = FOREACH B GENERATE group, SUM(A.cost);

STORE C INTO '<your name>/billing/state-sales';
