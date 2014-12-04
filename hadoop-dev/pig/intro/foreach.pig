-- FOR EACH lab
-- answer : labs-private/solutions/hadoop-solutions/pig/foreach-answer.pig

-- ## TODO : set the name of job
SET job.name 'MY_NAME foreach.pig';

-- ## TODO : change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

-- ## TODO : lets extract custid and cost
-- A = FOREACH billing_data GENERATE ??? , ???;
-- DESCRIBE A;
-- EXPLAIN A;
-- DUMP A;

-- ## TODO : generate custid, and cost_in_dollars
-- ## Assume cost is in cents.  Convert it to dollars
-- ## hint : divide by 100
-- ## check the output, is the output correct?
-- ## what do you have to do to fix it?
-- B = FOREACH .....
-- DESCRIBE B;
-- DUMP B;
