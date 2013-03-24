-- pig-billing-itemized.pig

-- Parse Input File
billing_data = LOAD '/billing-data/*.log' USING PigStorage(',') AS (timestamp:chararray,custid:chararray,resourceid:chararray,qty:int,cost:int);

// TODO: Find total cost by custid and resourceid
total_by_customer_itemized = // Get total by customer id itemized by resourceid

STORE total_by_customer_itemized INTO 'pig-billing-ouput';
