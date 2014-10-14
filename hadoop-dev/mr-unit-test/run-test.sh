#!/bin/bash
classpath="a.jar:$(hadoop classpath):../lib/mrunit-hadoop2/*"

java -cp $classpath  org.junit.runner.JUnitCore  hi.mr.MapperTest
