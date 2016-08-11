#Lab : Hive Internal vs external tables

## Working dir 
`HI-labs/hadoop-dev/hive/intro`

## Note
There two clients `hive` and `beeline`.  For detailed usage see [here](../README.md)

## STEP 0:  Go to working dir
(Replace MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hive/intro
```

## STEP 1:  Create an external table

### STEP 1.1: Edit the file : `ext.q`.  
Fix TODOs.  
Use `nano ext.q` or `vi ext.q`

### STEP 1.2: Execute the script.  
```bash
    $   hive -f  ext.q
```


## STEP 2: Verify table and data in hive
Launch Hive shell and execute the following commands.  
Be sure to replace MY_NAME appropriately.
```
    $   hive
    hive>   show tables;
    hive>   select * from MY_NAME_ext;  
    hive>   quit;
```
There should be no data in the table.


## STEP 3) Copy data into Hive table
Replace MY_NAME appropriately.  
```bash
    $   hdfs   dfs -mkdir  -p  MY_NAME/billing/hive
    $   hdfs   dfs -put   ../../../data/billing-data/sample.txt    MY_NAME/billing/hive/
```

Now launch Hive shell and see if there is any data in table
```bash
    $   hive
    >   select * from MY_NAME_ext;
```
Do you see data?
How many rows?

Try this:
Copy the same sample file `sample.txt`  as  `sample2.txt` into Hive.   
Replace MY_NAME appropriately.
```bash
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    MY_NAME/billing/hive/sample2.txt
```

Now launch Hive shell and see if there is any data in table
```bash
    $   hive
    hive>   select * from MY_NAME_ext;
```
Do you see data?  
How many rows?  
Hive will pick up all files in the directory.  



## STEP 4: Creating internal table
Edit the file : `int.q`  
Fix TODOs.   
Execute the script.   
```bash
    $  hive -f  int.q
```

## STEP 5: Verify table and data in hive
Launch Hive shell
```bash
    $   hive
    hive>   show tables;
    hive>   select * from MY_NAME_int;
    hive>   quit;
```
Any data?


## STEP 6:  Stage some billing data in HDFS
Update MY_NAME appropriately.  
```bash
    $   hdfs  dfs -mkdir   MY_NAME/billing/stage
    $   hdfs  dfs -put  ../../../data/billing-data/sample.txt    MY_NAME/billing/stage/
```


## STEP 7:   Load data into Hive table
Start hive shell and run the load command.  
Update MY_NAME appropriately.  
```bash
    $   hive
    hive>   LOAD DATA INPATH 'MY_NAME/billing/stage' INTO TABLE MY_NAME_int;
```

If the load is successful, query the internal table.  
```
    hive>   select * from MY_NAME_int;
```
Do you see any data?

## STEP 8:  Verifying internal table location in HDFS
Using HDFS file browser, find out where the internal table `MY_NAME_int`  lives.   
Hint : Look into  `/user/hive` (or `/apps/hive`)  directory


## STEP 9:  Dropping tables
In Hive shell drop the tables you just created.  
Update MY_NAME appropriately.  
```
    $  hive
    hive>   drop table MY_NAME_ext;
    hive>   drop table MY_NAME_int;
    hive>   show tables;
```


## STEP 10:  Verify what happened to the data HDFS
Browse HDFS directories
- for internal table :   `/user/hive`  or `/apps/hive`
- external table :   `/user/<login name>/MY_NAME/billing/hive`

Which data deleted?  which data is preserved?


## BONUS LAB 1:  distinguishing internal / external table.  
(Do this before dropping tables :-)
How can we find out if a table is internal or external?  
Hint : refer to Hive manual for `describe`  
- https://cwiki.apache.org/confluence/display/Hive/LanguageManual
or
- https://github.com/elephantscale/HI-labs/blob/master/hadoop-dev/hive/Hortonworks-CheatSheet-SqlHive.pdf
