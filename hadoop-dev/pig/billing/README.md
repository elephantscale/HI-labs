# Pig Lab : Calculate customer invoice

## Working Dir
`HI-labs/hadoop-dev/pig/billing`

**(Instructor : Answer  `/labs-solutions/hadoop/pig/billing-answer.pig`)**

## STEP 1:  Lab setup
If you had already uploaded billing data into HDFS, you can skip this step.


### Go to the correct working directory:
Update MY_NAME accordingly.
```bash
    $   cd  ~/MY_NAME/HI-labs/hadoop-dev/pig/billing
```

### Copy billing data files into HDFS
Make sure you are in correct working dir
```bash
    $   cd  ~/MY_NAME/HI-labs/hadoop-dev/pig/billing
```

Create an HDFS directory
```bash
    $   hdfs   dfs   -mkdir  -p    MY_NAME/billing/in
```

Copy a sample file into HDFS
```
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    MY_NAME/billing/in/
```


Generate some more data and copy into HDFS.   
This will generate a few files
```
    $  python ../../../data/billing-data/gen-billing-data.py
```


Copy the files into HDFS as well
```
    $  hdfs   dfs   -put   billing*.csv    MY_NAME/billing/in
```

Now we have all data files in HDFS.  Verify this by
```
    $   hdfs   dfs  -ls   MY_NAME/billing/in
```

## STEP 2 )  Edit the Pig script 
Edit file :    `billing.pig`.  
You can use VI or NANO
```
    $   vi billing.pig
    # or
    $   nano  billing.pig
```
Fix TODO items and save the file.   
And run the script as follows.

```bash
    $  pig billing.pig
```



## STEP 3: See the results in HDFS
Browse HDFS file system.  Navigate to your `MY_NAME/billing/out` dir


## STEP 4: Examine the job stats from YARN UI
Find the job under 'completed jobs' section.   
