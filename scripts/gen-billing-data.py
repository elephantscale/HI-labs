#!/usr/bin/env python

## generates mock billing data files
## log format
##   timestamp (in ms), user_id, resource_id, zone_id, cost

## timestamp converstions testing site : http://www.epochconverter.com/


## ----- config
days=10
entries_per_day=10000
## --- end config


import os
import datetime as dt
import random

# overwrite this function to customize log generation
def generate_log(timestamp):
  user_id = random.randint(1,1000000)
  resource_id = random.randint(1,20)
  zone_id = random.randint(1,10)

  #cost is in hudreds of cents, could be zero
  cost = random.randint(1,200) - 20
  if (cost < 0):
    cost = 0

  logline = "%s, %s, %s, %s, %s" % (timestamp, user_id, resource_id, zone_id, cost)
  #print logline
  return logline



#main
## --- script main
if __name__ == '__main__':
  time_inc_ms = int ((24.0*3600*1000)/entries_per_day)
  #print "time inc ms", time_inc_ms
  #epoch = dt.datetime.fromtimestamp(0)
  epoch = dt.datetime(1970,1,1)

  year_start = dt.datetime(2012, 1, 1)
  for day in range(1, days+1):
    day_delta = dt.timedelta(days=day)
    start_ts = year_start + day_delta
    end_ts = dt.datetime(start_ts.year, start_ts.month, start_ts.day, 23, 59, 59)
    filename = start_ts.strftime("%Y-%m-%d") + ".log"
    #print start_ts
    #print end_ts
    last_ts = start_ts

    with open(filename, "w") as fout:
      print "generating log ", filename
      while (last_ts < end_ts):
        delta_since_epoch = last_ts - epoch
        millis = int((delta_since_epoch.microseconds + (delta_since_epoch.seconds + delta_since_epoch.days * 24 * 3600) * 10**6) / 1e3)
        #print "last ts", last_ts
        #print "millis",  millis
        logline = generate_log(millis)
        fout.write(logline + "\n")

        last_ts = last_ts + dt.timedelta(milliseconds=time_inc_ms)

