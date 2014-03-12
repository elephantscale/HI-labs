-- TODO : replace <user_name> with your username
-- TODO : replace <login_name> with actual login name

create external table <your_name>_books (line string)
row format delimited
fields terminated by '\n'
stored as textfile
location '/user/<login_name>/<your_name>/hive/books'
