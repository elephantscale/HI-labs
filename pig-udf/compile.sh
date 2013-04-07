#!/bin/bash

if [ -z $PIG_INSTALL ]
then
        #echo "setting PIG_INSTALL=/hadoop/pig"
        PIG_INSTALL=/hadoop/pig
fi

echo "PIG_INSTALL=$PIG_INSTALL"

CLASS_DIR=classes2
mkdir -p $CLASS_DIR
rm -rf $CLASS_DIR/*


javac -d $CLASS_DIR  -sourcepath src -classpath $PIG_INSTALL/pig-0.8.0-cdh3u0-core.jar  $(find src -name "*.java")

rm -rf myudf.jar
jar cf myudf.jar -C $CLASS_DIR .


