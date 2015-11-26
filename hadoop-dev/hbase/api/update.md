# Lab : Use HBase Java APIs for CRUD
----
Project dir : `HI-labs/hadoop-dev/hbase/api`   
You can also open the project in eclipse


## STEP 0: Switch To Working Directory
(Change MYNAME accordingly)
```
    $   cd   ~/MYNAME/HI-labs/hadoop-dev/hbase/api
```


## STEP 1) Edit Update.java
Edit the file : `src/main/java/hi/hbase/Update.java`.  
And complete the TODO items.
```
    $   vi  src/main/java/hi/hbase/Update.java
    # or
    $   nano  src/main/java/hi/hbase/Update.java
```

## STEP 2: Compile The Code
From the project working dir
```
    $    mvn clean package
```
This should create jar files under `target/` directory


## STEP 3: Update HBase
Note : make sure you have created 'MY_NAME_users' table before proceeding further.  
Run the executable `update.sh`
```
    $ ./update.sh
    or
    $ sh ./update.sh
```

To reduce screen clutter you can try this:
```
    # redirect logs into 'logs' file
    $  ./update.sh  2> logs
```


At the end of the run you should see something like:

    update took 8 ms


## STEP 4: Verify User Record Is Updated
Start hbase shell
```
    $ hbase shell
```

Get the row for updated user-id.  
Hint : `get`

    COLUMN                     CELL
     info:email                timestamp=1399417156994, value=user-10@gmail.com
     info:phone                timestamp=1399360374232, value=555-1234

We can see email has been updated.


## STEP 5: Add Another Email Address
Modify the update code to insert another email address : `email2`.   
Compile and run the code.  
Inspect the user record.  
What is the observation.  


## BONUS Lab 1:  Upsert
Edit file `src/main/java/hi/hbase/Update.java`. 
Change the user-id to some id that you know doesn't exist  (e.g : user-999).  
Compile and run the code.
Does HBase throw a 'record not found' exception?   
Discuss this behavior.  


## BONUS Lab 2: Check And Update
Say we want to update a column only if the record is present.  
For example, let's update the email to "newemail@gmail.com"  ONLY if the existing email address is "oldemail@gmail.com".  
How can we accomplish this?

Hint : `HTable.checkAndPut()`
