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
            customer_id = x
            name = "Customer %s" % x
            email = "customer-%s@email.com" % x
            state = random.choice(states)
            discount = random.randint(1,20) - 10
            if discount < 0:
                discount = ""
            logline = "%s,%s,%s,%s,%s" % (customer_id, name, email, state, discount )
            #print logline
            fout.write(logline + "\n")




