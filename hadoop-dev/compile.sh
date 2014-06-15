#!/bin/bash

## compile script


build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*

#classpath="$(hadoop classpath):$(hbase classpath)"
classpath="$(hadoop classpath)"
#echo $classpath

javac -d $build_dir  -sourcepath src -classpath "$classpath"  $(find src -name "*.java")

rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
