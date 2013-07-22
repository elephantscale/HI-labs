#!/bin/bash

build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*


javac -d $build_dir  -sourcepath src -classpath lib/*:../lib/*:../lib/mrunit-hadoop1/*:../lib/hbase/*:../lib/hive/*  $(find src -name "*.java")


rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
