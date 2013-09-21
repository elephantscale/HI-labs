-- replace <user_name> with your username
create external table books (line string) 
row format delimited 
fields terminated by '\n'
stored as textfile
location '/tmp/<user_name>/hive/in'
