#!/usr/bin/env python

## generates mock log data files
## log format
##   SEVERITY   log_message


## ----- config
days=3
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
  for day in range(0, days):
    filename = "%d.log" % day

    with open(filename, "w") as fout:
      print "generating log ", filename
      for entry in range(0, entries_per_day):
          logline = "%s: this is a log message" % choice(severity)
          fout.write(logline + "\n")

