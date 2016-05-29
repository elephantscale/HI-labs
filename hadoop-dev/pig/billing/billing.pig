-- pig-billing.pig

-- Pig Latin reference : http://pig.apache.org/docs/r0.11.1/basic.html

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME billing.pig';

-- TIP : Verify each step is working before going to the next one
-- you can use DUMP statements to verify the output is correct.
-- e.g :    A = ....
--          DUMP A;
-- verify that the output looks correct before going further.
-- once verified comment out the DUMP statements (because each DUMP statement will run MR job... it will just take more time)

-- ## TODO-2 : Load data, change MY_NAME
-- Parse Input File
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

-- ## TODO-3 : extract customer_id & cost
-- cid_cost = FOREACH billing_data  GENERATE ???,  ???  ;
-- DESCRIBE cid_cost;
-- DUMP cid_cost;

-- ## TODO-4 : group by customer
-- grp_by_cid = .....
-- DUMP grp_by_cid;
-- DESCRIBE grp_by_cid;

-- ## TODO-5 : then sum cost
-- ## hint : sum(cost) won't work, b/c cost is nested.
-- ##        we have to say   X.cost  
-- ##        inspect DESCRIBE grp_by_cid  output to determine what X is
-- total_by_cid = FOREACH grp_by_cid GENERATE group, SUM(???.???) as total;
-- DUMP total_by_cid;

-- ## TODO-6 : now process all the files
-- change LOAD example from 'billing/in/sample.txt' --> 'billing/in'   (consume the entire dir)
-- ## NOTE : turn off any DUMP statements before running with large datasets !
-- ## Instructor can provide even larger datasets  to run on

-- ## TODO-7 : Save the result into HDFS - change MY_NAME
-- STORE total_by_cid INTO 'MY_NAME/billing/pig-invoice';
