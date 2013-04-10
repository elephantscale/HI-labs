-- first you put the resource log into hdfs
load data inpath '/intel/training/resource-generated-numbers.log'
into table resource_log;
