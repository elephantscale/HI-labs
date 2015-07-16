#!/bin/bash

# (optional) add any extra classpath here
extra_classpath=""
classpath="target/hbase-api-1.0.jar:$(hbase classpath):$extra_classpath"

java -cp "$classpath"  hi.hbase.Connect
