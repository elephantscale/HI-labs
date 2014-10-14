#!/bin/bash

# tmp hack for hadoop2 distros

build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*

classpath="$(hadoop classpath):../lib/mrunit-hadoop2/*"


javac -d $build_dir  -sourcepath src -classpath "$classpath" $(find src -name "*.java")


rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
