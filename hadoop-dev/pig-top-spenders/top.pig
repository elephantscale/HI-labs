-- pig-billing.pig

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DUMP billing_data;

-- ## TODO: Find total cost by custid
-- ## first group by customer
-- ## then sum cost
-- ## then order by to find the top

DUMP total_by_customer;
-- STORE total_by_customer INTO '<your name>/billing/out';

-- ## TODO : now process all the files (change LOAD example from sample.txt --> *.log)
