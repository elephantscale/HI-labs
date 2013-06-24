#!/usr/bin/env ruby

require 'rubygems'
require 'json'

## generates mock billing data files
# log format
# timestamp (in ms), customer_id, resource_id, qty, cost

## multi threaded version... ruby doesn't have native threads, so threading has no effect
## execute with jruby to see true threading
## jruby log-gen.rb

# config
days=10
entries=100000
# end config


# overwrite this function to customize log generation
def generate_log(timestamp)

  customer_id = rand(1000000) + 1
  resource_id = rand(10) + 1
  qty = rand(100)

  #cost is in cents, could be zero
  cost = rand(200) - 20
  cost = 0 if cost < 0

  logline = "#{timestamp},#{customer_id},#{resource_id},#{qty},#{cost}"
  #puts logline

  ## generate JSON format
  #dict = {"timestamp" =>  timestamp,
    #"customer_id" =>  customer_id,
    #"resource_id" => resource_id,
    #"qty" => zone_id,
    #"cost" => cost
  #}
  #logline = JSON::generate(dict)


  logline
end

time_inc = (24.0*3600)/entries
#puts "time inc : #{time_inc}"




threads = []

0.upto(days-1) do |day|

  threads << Thread.new(day) do |myday|
    start_ts = Time.local(2012, 1, 1) + myday * 24 * 3600
    end_ts = Time.local(2012, 1, 1 , 23, 59, 59) + myday * 24 * 3600
    filename = start_ts.strftime("%Y-%m-%d") + ".log"
    puts "writing #{filename}"
    last_ts = start_ts
    File.open(filename, 'w') do |f|
      while last_ts < end_ts
        last_ts =  last_ts + time_inc

        timestamp = (last_ts.to_f*1000).to_i

        logline = generate_log(timestamp)
        f.write "#{logline}\n"

      end
    end
  end
end

threads.each {|t| t.join}
