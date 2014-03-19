-- replace 'mark' with your username
create external table resource_log (customer_id int, cost int) 
row format delimited 
fields terminated by ' '
stored as textfile
location '/user/mark/mark/hive/in'
