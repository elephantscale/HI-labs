-- first you put moby-dick.txt into hdfs
-- hadoop dfs -mkdir hive/in
-- hadoop dfs -put test-data/texts/moby-dick.txt hive/in
load data inpath 'hive/in'
into table books;

-- observe that the data in hive/in has been removed
-- also observe that the table data now is in /intel/hive/books
