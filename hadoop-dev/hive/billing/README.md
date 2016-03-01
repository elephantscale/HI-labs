# Lab : Hive Customer Billing

## Working dir:
`HI-labs/hadoop-dev/hive/billing`

**Note : Replace MY_NAME appropriately throughout the lab.** 

**Hint : To see column names set the following property in hive shell**
```
    hive>   set hive.cli.print.header=true;
```

## STEP 1) Create a Hive table
Lets create an external table for our billing data.  
Edit file `billing_ext.q` .   
Fix the TODO items.  
Run the script as follows
```
    $   hive -f billing_ext.q
```

## STEP 2) Launch Hive shell, and inspect the table just created
```
    $ hive
    hive > show tables;

    hive > describe MY_NAME_billing;
```


## STEP 3) Load data into billing table
```
    $  hdfs  dfs -mkdir -p MY_NAME/billing/in
```

Copy sample billing data.  
```
    $ hdfs dfs -put ../../../data/billing-data/sample.txt   MY_NAME/billing/in/
```

## STEP 4)  Run query
Lets count the number of rows in the table
Launch hive shell
```
    $ hive
    hive >  select count(*) from MY_NAME_billing;
```

This will actually kick off a mapreduce job, and at the end you will get the count.

**Q : how many mappers and how many reducers? **   
**Q : Can you explain how to do count(*) in MR?**  


## STEP 5) Query data
```
    $ hive

    hive > select * from MY_NAME_billing limit 10;
```

Output might look like:
```console
    OK
    1325376000000   614156  6   77  89
    1325376000864   471440  10  25  0
    1325376001728   377292  3   63  83
```

Another query:
```
    hive > select * from MY_NAME_billing where customer_id = 1 limit 5;
```

## STEP 6) Calculate customer totals
Launch hive shell and run the query.
```
    $ hive
    hive > select customer_id, SUM(cost) as total from MY_NAME_billing group by customer_id limit 5;
```

## STEP 8) Find top 10 spending customers
What is the query?

### 8.1: Execute the query in Hive shell (interactive mode)

### 8.2: Run the query in 'script' mode
Create a file `top.q` and place the above query in the file.  
Save the file and run the it using Hive as follows.

```
    $ hive -f top.q
```

**=> Question : how many mapreduce jobs are being kicked off?  Why?** 


## STEP 9) Generating more data
Generate more data for testing.
```
    $  python ../../../data/billing-data/gen-billing-data.py
```

Upload data into HDFS.
```
    $  hdfs  dfs -put   billing*.csv     MY_NAME/billing/in/
```

Go ahead and find top-10 customers on this larger data set


## STEP 10)  Creating invoice table
Printing to screen is great for developing / debugging.  
We want to save the calculated invoices into a table.

Edit file : `invoices_ext.q`   
Fix TODOs.  
Execute the script to create table.  
```
    $  hive  -f  invoices_ext.q
```


## STEP 11)  Save results into invoice table
Edit file : `inv.q` .   
Fix TODOs.   
Execute the script.   
```
    $   hive -f inv.q
```


## Bonus Lab:
Can you find 'free' resource usage.   
Hint: consider 'cost' field.

Which users uses most 'free' stuff?  (top freeloaders :-)
