#!/usr/bin/env python

## generates mock customer data files
## log format
##   customer_id, email


## ----- config
entries=100000
file_name='customers.log'
## --- end config


import os
import datetime as dt
import random
import json

states = ['CA', 'NV' , 'AZ', 'NM', 'OR', 'WA', 'TX']


#main
## --- script main
if __name__ == '__main__':
    with open(file_name, "w") as fout:
        print "generating file ", file_name
        for x in range(1, entries+1):
            #print x
            logline = "%s,Customer-%s, customer-%s@email.com, %s" % (x, x, x, random.choice(states))
            #print logline
            fout.write(logline + "\n")




