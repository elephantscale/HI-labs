-- pig-billing.pig

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

-- ## TODO: Find total cost by custid
-- ## first group by customer
-- ## then sum cost

STORE total_by_customer INTO '<your name>/billing/out';

-- ## TODO : now process all the files (change LOAD example from sample.txt --> *.log)
