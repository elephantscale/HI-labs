Lab: Analyzing Text Data

== STEP 1)
Make a directory in HDFS to store books data.
    $  hdfs  dfs  -mkdir  -p <your name>/hive/books

Copy the data 'moby-dick.txt' file into the above directory
    $  hdfs  dfs  -put  moby-dick.txt   <your name>/hive/books/


== STEP 2)
Create a hive table for books
Edit file 'create_table_books.q' and fix TODO items.
Execute the script
    $ hive -f create_table_books.q

verify the table
    $ hive -e 'show tables'


==  STEP 3)
Examine the data in 'books'
    $  hive -e 'select * from <your_name>_books limit 10'


== Next Step)
Follow   : ngrams.txt