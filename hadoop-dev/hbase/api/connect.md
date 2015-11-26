# Lab : Use HBase Java APIs for connecting
----

Project working dir : `HI-labs/hadoop-dev/hbase/api`.   
You can also open the project in eclipse


## STEP 0: Switch To Working Directory
(Change MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hbase/api
```


## STEP 1:  Edit Connect.java
Edit the file : `src/main/java/hi/hbase/Connect.java`.   
And complete the TODO items.
```
    $   vi  src/main/java/hi/hbase/Connect.java
    # or
    $   nano  src/main/java/hi/hbase/Connect.java
```

## STEP 2: Compile The Code
From the project working dir
```
    $    mvn clean package
```
This should create jar files under `target/` directory


## STEP 3: Connect to HBase
Note : make sure you have created `MYNAME_users` table before proceeding further.  
Run the executable `connect.sh` as follows
```
    $ ./connect.sh
    # or
    $ sh ./connect.sh
```

To reduce screen clutter you can try this:
```
    # redirect logs into 'logs' file
    $  ./connect.sh  2> logs
```

Watch the output on console.
At the end of the run you should see something like:
```
    connected to sujee_users
```



## BONUS Lab 1: Measure Connection Latency
Find out how much time it takes to establish a connection.  
You can use the following Java code.

```java
    long  t1 = System.currentTimeMillis();
    // establish connection
    long  t2 = System.currentTimeMillis();
    System.out.println ("### connection took : " + (t2 - t1) + " ms");
```


## BONUS Lab 2: Reducing Connection Latency By Using A ConnectionPool

Connection pooling is a common technique to reduce connection latencies.   
So instead of making a new connection each time,  we pick from an existing pool of connections; thus reducing latency.

Update `Connect.java` to use connection pooling.   
Look at Javadocs for class `HTablePool`
