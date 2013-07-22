#!/bin/bash
java -cp a.jar:../lib/*:../lib/mrunit-hadoop1/*  org.junit.runner.JUnitCore  hi.mr.MapperTest
