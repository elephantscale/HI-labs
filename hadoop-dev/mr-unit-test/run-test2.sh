#!/bin/bash
java -cp a.jar:/usr/lib/hadoop/*:/usr/lib/hadoop/lib/*:/usr/lib/hadoop-hdfs/*:/usr/lib/hadoop-0.20-mapreduce/*:../lib/mrunit-hadoop2/*  org.junit.runner.JUnitCore  hi.mr.MapperTest
