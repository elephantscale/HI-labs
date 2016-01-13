#!/bin/bash

## compile script

export HADOOP_VERSION=`hadoop version | grep Hadoop | sed 's/Hadoop [1-2]\.[0-9]\.[0-9]\.//g'`
echo $HADOOP_VERSION

build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*

#classpath="$(hadoop classpath):$(hbase classpath)"
#export additional_classpath=/usr/hdp/$HADOOP_VERSION/hive/lib/*:/usr/hdp/$HADOOP_VERSION/pig/*:/usr/hdp/$HADOOP_VERSION/pig/lib/*:./lib/*:/opt/cloudera/parcels/CDH/jars/*
# Hortonworks or Cloudera, does not matter
export additional_classpath=/usr/hdp/$HADOOP_VERSION/hive/lib/*:/usr/hdp/$HA    DOOP_VERSION/pig/*:/usr/hdp/$HADOOP_VERSION/pig/lib/*:./lib/*:/opt/cloudera/    parcels/CDH/jars/*:/usr/lib/pig/*:/usr/lib/pig/lib/*
classpath="$(hadoop classpath)":$additional_classpath
echo $classpath

javac -d $build_dir  -sourcepath src -classpath "$classpath"  $(find src -name "*.java")

rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
