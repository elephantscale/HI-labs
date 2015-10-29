# Lab : Use HBase Java APIs for CRUD
----

Project dir : `HI-labs/hadoop-dev/hbase/api`.  
You can also open the project in eclipse

## STEP 0: Switch To Working Directory
(Change MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hbase/api
```


## STEP 1) Edit Query.java
Edit the file : `src/main/java/hi/hbase/Query.java`.  
And complete the TODO items.
```
    $   vi  src/main/java/hi/hbase/Query.java
    # or
    $   nano  src/main/java/hi/hbase/Query.java
```

## STEP 2: Compile The Code
From the project working dir
```
    $    mvn clean package
```
This should create jar files under `target/` directory


## STEP 3: Query HBase
Note : make sure you have created `MYNAME_users` table before proceeding further.  
Run the executable `query.sh`
```
    $ ./query.sh
    # or
    $ sh ./query.sh
```

The output might look like:
```
    querying for userId : 39
         email=user-39@foo.com
         query time : 0.0060 ms

    querying for userId : 191
         not found
         query time : 0.041 ms
```

We try to query some random userIds.  
Take a look at the query time, they are pretty good (in milli seconds or sub-ms range!)


## BONUS LAB:  Get All Column Families And Columns For A Row
Think `select *`  
Hint : consult javadocs for `Get`  
Can you figure out the types for each column values?
