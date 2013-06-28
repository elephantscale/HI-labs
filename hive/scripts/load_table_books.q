-- first make sure you put moby-dick.txt into hdfs
-- hadoop dfs -mkdir um/mark/hive/in
-- hadoop dfs -put ../data/hive-data/moby-dick.txt um/mark/hive/in

-- replace 'mark' with your username
load data inpath 'um/mark/hive/in/moby-dick.txt'
into table books;
