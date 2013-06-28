-- replace 'mark' with your username

-- make sure you put moby-dick.txt into hdfs
-- hadoop dfs -mkdir /tmp/<user_name>/hive/in
-- hadoop dfs -put <LAB>/data/hive-data/moby-dick.txt /tmp/user_name>/hive/in

load data inpath '/tmp/<user_name>/hive/in/moby-dick.txt'
into table books;
