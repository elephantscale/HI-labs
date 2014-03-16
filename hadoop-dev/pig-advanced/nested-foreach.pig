-- ## TODO : set the name of job
SET job.name 'my_job';

REGISTER '../pig-udf/a.jar';

billing_data = LOAD 'sujee/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long, custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

dt = FOREACH billing_data GENERATE hi.udf.FullDateFromMilliSeconds(timestamp) as date:chararray, resourceid, cost;
-- DUMP dt;

grpd = group dt by (date, resourceid);
DUMP grpd;
describe grpd;

by_date_count = foreach grpd {
    cost = dt.cost;
    generate group, SUM(cost);
 };
