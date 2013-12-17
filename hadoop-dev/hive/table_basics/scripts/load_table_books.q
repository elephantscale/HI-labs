-- replace <user_name> with your username
-- replace <lab_dir> with the top directory to the labs

-- make sure you put moby-dick.txt into hdfs, as follows:
-- hadoop dfs -mkdir /tmp/<user_name>/hive/in
-- hadoop dfs -put <lab_dir>/data/hive-data/moby-dick.txt /tmp/user_name>/hive/in

load data inpath '/tmp/<user_name>/hive/in/moby-dick.txt'
into table books;
