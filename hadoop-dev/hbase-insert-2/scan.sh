#!/bin/bash

# (optional) add any extra classpath here
extra_classpath=""
classpath="a.jar:$(hbase classpath):$extra_classpath"

java -cp "$classpath" hi.hbase.UserScan $*
