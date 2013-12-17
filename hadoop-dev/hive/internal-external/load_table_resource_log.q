-- first make sure you put resource-generated-numbers.log into hdfs
-- hadoop dfs -mkdir um/mark/hive/in
-- hadoop dfs -put ../data/hive-data/resource-generated-numbers.log um/mark/hive/in

-- replace 'mark' with your username
load data inpath '/user/ec2-user/mark/hive/in/resource-generated-numbers.log'
into table resource_log;
