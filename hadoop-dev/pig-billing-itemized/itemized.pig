-- pig-billing-itemized.pig

-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);

-- ## TODO: Find total cost by custid and resourceid
-- ## hint : group by two items (??, ??)
-- ##        then sum(cost)

STORE total_by_customer_itemized INTO 'pig-billing-ouput';
