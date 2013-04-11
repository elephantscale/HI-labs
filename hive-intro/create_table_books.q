create external table books (line string) 
row format delimited 
fields terminated by '\n'
stored as textfile
location '/intel/hive/books'
