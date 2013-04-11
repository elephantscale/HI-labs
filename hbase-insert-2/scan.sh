#!/bin/bash
java -cp a.jar:../lib/*:../lib/mrunit/*:../lib/hbase/*  hi.hbase.UserScan $*
