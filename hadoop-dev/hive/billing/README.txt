Lab : Hive Customer Billing
project dir : HI-labs/hadoop-dev/hive/billing


== STEP 1)
Lets create an external table for our billing data
inspect file billing_ext.q
fix the TODO items


== STEP 2) use Hive to create the table
    $ hive -f billing_ext.q


== STEP 3) launch Hive shell, and inspect the table just created
    $ hive
    hive > show tables;

    hive > describe <your_name>_billing;


=== STEP 4) Load data into billing table
(if you have billing data already in your billing/in  directory, you can skip this step)
    $  hdfs  dfs -mkdir  <your name>/billing/in

generate data
    $  python ../../../data/billing-data/gen-billing-data.py

upload data into HDFS
    $  hdfs  dfs -put   billing*.log     <you name>/billing/in/


== STEP 5) lets count the number of rows in the table
Launch hive shell
    $ hive

    hive >  select count(*) from <your name>_billing;

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


== STEP 8) find top 10 spending customers
what is the query?

You can execute this query directly from hive shell, or place this in a file (e.g top.q) and execute it using hive
    $ hive -f top.q

Question : how many mapreduce jobs are being kicked off?  Why?


== STEP 8)  creating invoice table
printing to screen is great for developing / debugging.
we want to save the calculated invoices into a table.

Edit file : invoices_ext.q
Fix TODOs
Execute the script to create table
    $  hive  -f  invoices_ext.q


== STEP 9)  Save results into invoice table
Edit file : inv.q
Fix TODOs
Execute the scripts
    $   hive -f inv.q


== Bonus Lab:

Can you find 'free' resource usage.
    (hint, consider 'cost' field)

Which users uses most 'free' stuff?  (top freeloaders :-)
