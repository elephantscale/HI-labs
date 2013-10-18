#!/usr/bin/env python

## generates mock log data files
## log format
##   SEVERITY   log_message


## ----- config
files=10
entries_per_day=5000000
log_format="csv"
#log_format="json"
## --- end config


import os
import datetime as dt
from random import choice
import json



#main
## --- script main
if __name__ == '__main__':
  severity = ['INFO', 'ERROR',  'WARN', 'DEGUG']
  for f in range(0, files):
    filename = "%d.log" % f

    with open(filename, "w") as fout:
      print "generating log ", filename
      for entry in range(0, entries_per_day):
          logline = "%s: this is a log message" % choice(severity)
          fout.write(logline + "\n")

