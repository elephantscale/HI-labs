Lab : Hive
project dir : hive-intro
you can also open the project in eclipse

============================================================
LAB 1: Create and import tables, run queries
============================================================
STEP 1) 
Analyze script scripts/create_table_books.q, adjust it with your username
Execute the following commands
hive -e 'show tables'
hive -f scripts/create_table_books.q
(if the table is already there, do this: hive -e 'drop table books')
hive -e 'describe books'

STEP 2)
Analyze script scripts/load_table_books.q, adjust it with your username
Execute HFDS instructions in this script, then run the script
hive -f scripts/load_table_books.q
hive -e 'select count(*) from books' 
Count the number of characters in the book:
hive -e 'select sum(length(line)) from books'

Extra credit:
Count words in 'books'
Hint: use a UDF
Answer: hi.hive.CountWords.java

============================================================
LAB 2:
============================================================
STEP 1) 
Analyze script scripts/create_table_resource_log.q, adjust it with your username
Execute the following commands
hive -e 'show tables'
hive -f scripts/create_table_resource_log.q
(if the table is already there, do this: hive -e 'drop table resource_log')
hive -e 'describe resource_log'

STEP 2)
Analyze script scripts/load_table_resource_log.q, adjust it with your username
Execute HFDS instructions in this script, then run the script
hive -f scripts/load_table_resource_log.q
hive -f scripts/invoices_resources.q
Note the output: for easy verification, 
the input data is created to invoice each customer the same amount 
============================================================
LAB 3:
============================================================
STEP 1) 
STEP 2) 

============================================================
LAB 4:
============================================================
STEP 1) 
STEP 2) 

============================================================
LAB 5:
============================================================
STEP 1) 
STEP 2) 
