#!/bin/bash
java -cp a.jar:/usr/lib/hadoop/*:/usr/lib/hbase/*:/usr/lib/hbase/lib/*  hi.hbase.UserScan $*
