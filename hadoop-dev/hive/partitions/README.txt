Lab : create partitioned tables
location : HI-labs/hadoop-dev/hive/partitions

=== STEP 1) Create a partitioned table
Edit file  : billing_p.q
Fix TODOs
Execute the script
    $   hive -f  billing_p.q

Verify table is created by running
    $   hive -e 'show tables'


=== STEP 2) Create some data to be uploaded
    $   python ../../../data/billing-data/gen-billing-data.py
this will generate a few billing data files


==== STEP 3) load data
In this step, we are going to load data directly from local computer  (not staging into HDFS)

    $  hive
    hive> load data local inpath './billing-2012-01-01.log' INTO TABLE <your name>_billing_p partition (dt='2012-01-01');

    hive> load data local inpath './billing-2012-01-02.log' INTO TABLE <your name>_billing_p partition (dt='2012-01-02');

Note 1 :  we have to manually specify the partition.


=== STEP 4)  Verify file layout
You can browse '<your name>/billing/hivep'  directory
or use
    $   hdfs dfs -ls -R   <your name>/billing/hivep


=== STEP 5)  using partitions
Lets run some queries using partitions
    $   hive
    hive>   select count(*) from <your name>_billing_p;

now specify partition
    hive>   select count(*) from <your name>_billing_p where dt='2012-01-01';

Note the count results.


=== BONUS LAB )
    Verify that Hive indeed only using data in partition directories.
    Hint : look at counters for Hive jobs at JobTracker UI.