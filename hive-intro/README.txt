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

============================================================
LAB 2:
============================================================
STEP 1) 
STEP 2) 

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
