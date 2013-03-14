#!/bin/bash

build_dir=build
mkdir -p $build_dir
rm -rf $build_dir/*


javac -d $build_dir  -sourcepath src -classpath lib/*:../lib/*  $(find src -name "*.java")


rm  -f a.jar
jar cf a.jar -C $build_dir .

rm -rf $build_dir
