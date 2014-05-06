#!/bin/bash

## compile script


build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*

#classpath="$(hadoop classpath):$(hbase classpath)"
classpath="$(hbase classpath)"
#echo $classpath

javac -d $build_dir  -sourcepath src/main -classpath "$classpath"  $(find src -name "*.java")

rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
