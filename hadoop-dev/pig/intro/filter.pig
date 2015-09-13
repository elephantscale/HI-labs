-- Filter
-- answer : labs-private/solutions/hadoop-solutions/pig/filter-answer.pig

-- Pig Latin Ref : https://pig.apache.org/docs/r0.7.0/piglatin_ref2.html

-- ## TODO : set the name of job
SET job.name 'MY_NAME filter.pig';

-- ## TODO : change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
DUMP billing_data;

-- ## TODO : filter only resourceid = 1
-- A = FILTER billing_data BY ..... ;
-- DUMP A;
-- DESCRIBE A;

-- ## TODO : filter free usage (cost == 0) for resource_id == 8
-- B = FILTER .....  ;
-- DUMP B;
-- DESCRIBE B;
