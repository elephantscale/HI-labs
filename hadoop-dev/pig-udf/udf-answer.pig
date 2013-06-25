-- # UDF example

register 'a.jar';

billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long, custid:chararray,resourceid:chararray,qty:int,cost:int);
DUMP billing_data;

-- # we are going to extract MONTH from timestamp using our UDF
A = FOREACH billing_records GENERATE hi.udf.MonthFromMilliSeconds(timestamp) as month, cost;
DUMP A;

by_month_grouped = GROUP A by month;
by_month_total = FOREACH by_month_grouped GENERATE group as month, SUM(A.cost) as total;
sorted = ORDER by_month_total BY total;
DUMP sorted;
