Lab : Hive Customer Billing
project dir : HI-labs/hadoop-dev/hive/billing


== STEP 1)
Lets create an external table for our billing data
inspect file create_table_billing.q
fix the TODO items


== STEP 2) use Hive to create the table
    $ hive -f create_table_billing.q


== STEP 3) launch Hive shell, and inspect the table just created
    $ hive
    hive > show tables;

    hive > describe <your_name>_billing;


=== STEP 4) Load data into billing table
(if you have billing data already in your billing/in  directory, you can skip this)
    $  hdfs  dfs -mkdir  <your name>/billing/in

generate data
    $  python ../../../data/billing-data/gen-billing-data.py

upload data into HDFS

    $  hdfs  dfs -put   billing*.log     <you name>/billing/in/

== STEP 5) lets count the number of rows in the table
Launch hive shell
    $ hive

    hive >  select count(1) from <your name>_billing;

This will actually kick off a mapreduce job, and at the end you will get the count


== STEP 6) see a sample of data
Lanch hive shell
    $ hive

    hive > select * from <your_name>_billing limit 10;
output might look like:
    OK
    1325376000000   614156  6   77  89
    1325376000864   471440  10  25  0
    1325376001728   377292  3   63  83

another query:
    hive > select * from <your name>_billing where customer_id = 61442 limit 5;


== STEP 7) calculate customer totals
launch hive shell
    $ hive
    hive > select customer_id, SUM(cost) as total from <your name>_billing group by customer_id limit 5;


== STEP 8) find top spending customers
the query will look like:
    select customer_id, SUM(cost) as total from <yourname>_billing group by customer_id order by total desc limit 5;

You can execute this query directly from hive shell, or place this in a file (e.g top.q) and execute it using hive
    $ hive -f top.q

Question : how many mapreduce jobs are being kicked off?  Why?


== Bonus Lab:

Can you find 'free' resource usage.
    (hint, consider 'cost' field)

Which users uses most 'free' stuff?  (top freeloaders :-)
