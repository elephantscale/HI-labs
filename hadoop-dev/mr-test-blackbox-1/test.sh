#!/bin/bash

# configuration
# TODO fix the paths
hdfs_output="<your_name>/billing/out1"
hdfs_input="<your_name>/billing/in"
local_output="mr.out"
local_expected="mr.expected"
# end config

# clean tmp output
rm -f "$local_output"

# clean hdfs out dir
hadoop dfs -rmr "$hdfs_output"

# run mr
hadoop jar a.jar  hi.mr.BillingTotalTest  "$hdfs_input"   "$hdfs_output"
retcode=$?

# what if mr job failed?
if [ "$retcode" -ne 0 ]
then
    echo "running map reduce failed...retcode=$retcode"
    exit $retcode
fi

# copy the file from hdfs to local dir
hadoop dfs -get  "$hdfs_output"/part-r-00000   "$local_output"
# check retcode (see above)
if [ "$retcode" -ne 0 ]
then
    echo "get file failed...retcode=$retcode"
    exit $retcode
fi


diff -q "$local_expected"  "$local_output"
retcode=$?

if [ "$retcode" -ne 0 ]
then
    echo "FAIL"
    exit $retcode
else
    echo "PASS"
fi

