# Pig Intro Lab : learning pig concepts

## project dir : 
    `HI-labs/hadoop-dev/pig/intro`

## STEP 1: Verify Pig is installed and configured properly
Invoke Pig in command line as follows:
```
        $   pig
```
Read the console output.  
Make sure pig can connect to HDFS and MapReduce.  
Exit pig shell by typing    `quit;`

We are going to be looking at billing data .  It looks as follows.

(Here is a [sample](../../../data/billing-data/sample.txt) )

```
#  timestamp,  customer_id,   resource_id,    qty,   cost
1325404800864,1,6,83,64
1325404801728,2,3,17,166
1325462400000,2,1,52,131
1325462404320,1,2,77,117
1325462412960,3,7,14,26
1325548802592,4,10,45,103
1325548816416,5,4,60,109
1325548830240,5,4,77,108
1325635204320,1,8,53,34
1325635230240,2,8,34,0

```


## STEP 2)  Lab setup

### Go to the correct working directory:
Update MY_NAME accordingly.
```bash
    $   cd  ~/MY_NAME/HI-labs/hadoop-dev/pig/intro
```

### Copy billing data files into HDFS
Make sure you are in correct working dir
```bash
    $   cd  ~/MY_NAME/HI-labs/hadoop-dev/pig/intro
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
    $  hdfs   dfs   -put   billing*.log    MY_NAME/billing/in
```

Now we have all data files in HDFS.  Verify this by
```
    $   hdfs   dfs  -ls   MY_NAME/billing/in
```


### Break : Wait for instructor to explain the next step.

## STEP 3 )  Edit the Pig script

Go to the correct working directory:  
Update MY_NAME accordingly.
```bash
    $   cd  ~/MY_NAME/HI-labs/hadoop-dev/pig/intro
```

Edit file :    `intro.pig`.  
You can use VI or NANO
```
    $   vi intro.pig
    # or
    $   nano  intro.pig
```
Fix TODO items and save the file.   
And run the script as follows.

```bash
    $  pig intro.pig
```

## TIPS

**To print/echo something from pig script**
```pig
    sh echo "hello there... "
```

**To change the name of pig script supply 'job.name' parameter** 
```
    $ pig -Djob.name="hello"  script.pig
```

**Turning off logging in pig** 
```
    $   pig script.pig   2> logs
    #  all logs will be sent to logs file
```
**'echoing' execution line by line   (like sh -x)** 
```
    $   pig   < script.pig
```
