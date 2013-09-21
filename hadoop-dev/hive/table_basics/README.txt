Lab: table operations

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

Or, you can come back to it later
