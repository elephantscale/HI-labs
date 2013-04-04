-- pig-billing.pig

-- Parse Input File
billing_data = LOAD '/billing-data/*.log' USING PigStorage(',') AS (timestamp:chararray,custid:chararray,resourceid:chararray,qty:int,cost:int);

// TODO: Find total cost by custid
total_by_customer = // Get total by customer id

STORE total_by_customer INTO 'pig-billing-ouput';
