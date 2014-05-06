#!/bin/bash

# (optional) add any extra classpath here
extra_classpath=""
classpath="a.jar:$(hbase classpath):$extra_classpath"

# if you used maven classpath would be
# classpath="target/hbase-put-get-1.0.jar:$(hbase classpath):$extra_classpath"

java -cp "$classpath"  hi.hbase.Update
