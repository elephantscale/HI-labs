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
    $  hdfs  dfs -mkdir  MY_NAME/billing/in

generate data
    $  python ../../../data/billing-data/gen-billing-data.py

upload data into HDFS
    $  hdfs  dfs -put   billing*.log     MY_NAME/billing/in/


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
    hive> load data local inpath './customers.log' INTO TABLE MY_NAME_customers;


=== STEP 6)  Verify data on both tables
    $   hive
    hive>  select * from MY_NAME_billing  LIMIT 10;
    hive>  select * from MY_NAME_customers  LIMIT 10;


=== STEP 7)
Lets do join
TODO : fix MY_NAME
    hive> select MY_NAME_billing.*, MY_NAME_customers.*
                from MY_NAME_billing join MY_NAME_customers on
                (MY_NAME_billing.customer_id = MY_NAME_customers.id)
                limit 10;


=== BONUS LAB 1) Calculate state-wide invoice totals
    Hint : customer table has state field

=== BONUS LAB 2) Apply customer discounts
    Hint : customer table has 'discount' percentage


=== BONUS LAB 3 )
Store the join results in another table
