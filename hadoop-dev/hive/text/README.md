# Lab: Analyzing Text Data

## Working dir
`<your workspace>/HI-labs/hadoop-dev/hive/text`

**Note : Replace MY_NAME appropriately throughout this lab**

## STEP 0:  Go to working dir
(Replace MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hive/text
```

## STEP 1)
Make a directory in HDFS to store books data.
```
    $  hdfs  dfs  -mkdir  -p MY_NAME/hive/text
```

Copy the data `moby-dick.txt` file into the above directory
```
    $  hdfs  dfs  -put  moby-dick.txt   MY_NAME/hive/text/
```


## STEP 2)
Create a hive table for books.  
Edit file `text.q` and fix TODO items.  
Execute the script.  
```
    $ hive -f text.q
```

Verify the table
```
    $ hive -e 'show tables'
```


##  STEP 3)
Examine the data in text table
```
    $  hive -e 'select * from MY_NAME_text limit 10'
```


## Next Step)
Continue on to [ngrams.md](ngrams.md)