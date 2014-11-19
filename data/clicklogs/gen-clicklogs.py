#!/usr/bin/env python

## generates mock click logs data
## log format
##   timestamp (in ms), user, action, domain, campaign_id, cost, session_id

## timestamp converstions testing site : http://www.epochconverter.com/


## ----- config
days=10
entries_per_day=100000
log_format="csv"
#log_format="json"
## --- end config


import os
import datetime as dt
import random
import json

domains = ['facebook.com',  'yahoo.com',   'google.com',   'zynga.com',    'wikipedia.org',   'sf.craigslist.org',   'twitter.com',    'amazon.com',    'flickr.com',    'cnn.com',      'usatoday.com',      'npr.org',    'foxnews.com',    'comedycentral.com',   'youtube.com',   'hulu.com',   'bbc.co.uk',  'nytimes.com',   'sfgate.com',   'funnyordie.com']

actions = ['viewed', 'clicked', 'blocked']

# overwrite this function to customize log generation
def generate_log(timestamp):
  user = random.randint(1,100000)
  action = random.choice(actions)
  domain = random.choice(domains)
  campaign = random.randint(1,20)
  session = "session_%s" % random.randint(1,100)
  #cost is in cents, could be zero
  cost = random.randint(1,200) - 20
  if (cost < 0):
    cost = 0

  #csv
  if (log_format == 'csv'):
    logline = "%s,%s,%s,%s,%s,%s,%s" % (timestamp, user, action, domain, campaign, cost, session)

  # generate JSON format
  #if (log_format == 'json'):
    #dict={'timestamp': timestamp, 'user': user, 'action': action, 'domain': domain,  'campaign':campaign, 'cost': cost,  'session': session}
    #logline = json.dumps(dict)


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
  for day in range(0, days):
    day_delta = dt.timedelta(days=day)
    start_ts = year_start + day_delta
    #end_ts = dt.datetime(start_ts.year, start_ts.month, start_ts.day, 23, 59, 59)
    end_ts = dt.datetime(start_ts.year, start_ts.month, start_ts.day+1, 0, 0, 0)
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

