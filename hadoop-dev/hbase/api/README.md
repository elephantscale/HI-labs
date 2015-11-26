# Lab : Use HBase Java APIs for CRUD (Create, Read, Update, Delete)
----

Project dir : `HI-labs/hadoop-dev/hbase/api`  
You can also open the project in eclipse.

HBase Java API : https://hbase.apache.org/apidocs/

## STEP 0: Switch To Working Directory
(Change MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hbase/api
```

## STEP 1: create a users table on hbase
Invoke hbase shell.  
```
    $  hbase shell
```

Create a `MY_NAME_users` table.  (Replace MY_NAME with your username.)
```
    hbase >   create 'MYNAME_users', 'info'
```

This table will have only ONE column family: `info`.   
HINT : `help 'create'`


## STEP 2: Connect
Follow : [connect.md](connect.md)


## STEP 3: Insert
Follow : [insert.md](insert.md)


## STEP 4: Query
Follow : [query.md](query.md)


## STEP 5: Update
Follow : [update.md](update.md)


## BONUS ) Delete
Follow : [delete.md](delete.md)
