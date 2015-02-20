-- TODO : replace MY_NAME with your username
-- TODO : replace LOGIN_NAME with actual login name

create external table MY_NAME_books (line string)
row format delimited
fields terminated by '\n'
stored as textfile
location '/user/LOGIN_NAME/MY_NAME/hive/books'
