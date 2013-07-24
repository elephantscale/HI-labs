#!/bin/bash

# tmp hack for hadoop2 distros

build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*


javac -d $build_dir  -sourcepath src -classpath /usr/lib/hadoop/*:/usr/lib/hadoop-hdfs/*:/usr/lib/hadoop-0.20-mapreduce/*:/usr/lib/hbase/*  $(find src -name "*.java")


rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
