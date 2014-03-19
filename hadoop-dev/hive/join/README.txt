Lab : Hive Join
location : HI-labs/hadoop-dev/hive/join

=== STEP 1) Create a billing table
(If you already have a billing table created you can skip this step)
Edit file  : create_table_billing_ext.q
Fix TODOs
Execute the script
    $   hive -f  create_table_billing_ext.q


=== STEP 2) load some billing data
(if you have billing data already in your billing/in  directory, you can skip this step)
    $  hdfs  dfs -mkdir  <your name>/billing/in

generate data
    $  python ../../../data/billing-data/gen-billing-data.py

upload data into HDFS
    $  hdfs  dfs -put   billing*.log     <you name>/billing/in/


=== STEP 3) Create customer table
Edit file  : create_table_customer_ext.q
Fix TODOs
Execute the script
    $   hive -f  create_table_customer_ext.q


=== STEP 4) Load some customer data
    $   python ../../../data/billing-data/gen-customer-data.py
this will generate a customers.log file


==== STEP 5) load customer data
In this step, we are going to load data directly from local computer  (not staging into HDFS)

    $  hive
    hive> load data local inpath './customers.log' INTO TABLE <your name>_customers;


=== STEP 6)  Verify data on both tables
    $   hive
    hive>  select * from <your name>_billing  LIMIT 10;
    hive>  select * from <your name>_customers  LIMIT 10;


=== STEP 7)
Lets do join
TODO : fix <your name>
    hive> select <your name>_billing.*, <your name>_customers.*
                from <your name>_billing join <your name>_customers on
                (<your name>_billing.customer_id = <your name>_customer.id)
                limit 10;


=== BONUS LAB )
Store the join results in another table
