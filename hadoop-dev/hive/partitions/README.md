# Lab : create partitioned tables

## working directory
`HI-labs/hadoop-dev/hive/partitions`

**Note : substitute MY_NAME in the instructions accordingly**

## STEP 0:  Go to working dir
(Replace MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hive/partitions
```

## STEP 1) Create a partitioned table
Edit file  : `billing_p.q`  
Fix TODOs.   
Execute the script.  
```
    $   hive -f  billing_p.q
```

Verify table is created by running
```
    $   hive -e 'show tables'
```


## STEP 2) Create some data to be uploaded
```
    $   python ../../../data/billing-data/gen-billing-data.py
```
This will generate a few billing data files.


## STEP 3) load data
In this step, we are going to load data directly from local computer  (not staging into HDFS).

```
    $  hive
    hive> load data local inpath './billing-2012-01-01.csv' INTO TABLE MY_NAME_billing_p partition (dt='2012-01-01');

    hive> load data local inpath './billing-2012-01-02.csv' INTO TABLE MY_NAME_billing_p partition (dt='2012-01-02');
```

Note :  We have to manually specify the partition.


## STEP 4)  Verify file layout
You can browse `MY_NAME/billing/hivep`  directory or use
```
    $   hdfs dfs -ls -R   MY_NAME/billing/hivep
```


## STEP 5)  Using partitions
Lets run some queries using partitions
```
    $   hive
    hive>   select count(*) from MY_NAME_billing_p;
```

Specifying partition
```
    hive>   select count(*) from MY_NAME_billing_p where dt='2012-01-01';
```

Note the count results.


## BONUS LAB )
Verify that Hive indeed only using data in partition directories.  
Hint : look at counters for Hive jobs in YARN UI
