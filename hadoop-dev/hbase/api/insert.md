Lab : Use HBase Java APIs for CRUD
----

Project dir : `HI-labs/hadoop-dev/hbase/api` .
You can also open the project in eclipse.

## STEP 0: Switch To Working Directory
(Change MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hbase/api
```


## STEP 1:  Edit Insert.java
Edit the file : `src/main/java/hi/hbase/Insert.java`.  
And complete the TODO items.
```
    $   vi  src/main/java/hi/hbase/Insert.java
    # or
    $   nano  src/main/java/hi/hbase/Insert.java
```


## STEP 2: Compile The Code
From the project working dir
```
    $    mvn clean package
```
This should create jar files under `target/` directory


## STEP 3: Insert Data Into HBase
Note : make sure you have created `MYNAME_users` table before proceeding further.  
Run the executable `insert.sh`
```
    $ ./insert.sh
    # or
    $ sh ./insert.sh
```

At the end of the run you should see something like:

    inserted 100 users  in 6 ms


## STEP 4: Verify `users` Table Is Populated
Start hbase shell
```
    $ hbase shell
```

**=> Q : Count the number of rows in your table**  
Hint : `count`  (`help 'count'`)

**=> Q : Also Scan the table (akin to select *) **  
Hint : `scan`

The output should look like:

```
ROW                        COLUMN+CELL
 user-0            column=info:email, timestamp=1399412991554, value=user-0@foo.com
 user-0            column=info:phone, timestamp=1399412991554, value=555-1234
 user-1            column=info:email, timestamp=1399412991563, value=user-1@foo.com
 user-1            column=info:phone, timestamp=1399412991563, value=555-1234
 user-10           column=info:email, timestamp=1399412991614, value=user-10@foo.com
 user-10           column=info:phone, timestamp=1399412991614, value=555-1234
 user-11           column=info:email, timestamp=1399412991620, value=user-11@foo.com
 user-11           column=info:phone, timestamp=1399412991620, value=555-1234

```

