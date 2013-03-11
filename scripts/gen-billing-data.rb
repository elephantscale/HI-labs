#!/usr/bin/env ruby


## generates mock billing data files 
# log format
# timestamp (in ms), user_id, resource_id, zone_id, cost

## multi threaded version... ruby doesn't have native threads, so threading has no effect
## execute with jruby to see true threading
## jruby log-gen.rb

# config
days=10
entries=100000
# end config

#domains = %w[facebook.com  yahoo.com   google.com   zynga.com    wikipedia.org   sf.craigslist.org   twitter.com    amazon.com    flickr.com    cnn.com      usatoday.com      npr.org    foxnews.com      comedycentral.com   youtube.com   hulu.com   bbc.co.uk  nytimes.com   sfgate.com   funnyordie.com]

# overwrite this function to customize log generation
def generate_log(timestamp)

  user_id = rand(1000000) + 1
  resource_id = rand(20) + 1
  zone_id = rand(10) + 1

  #cost is in hudreds of cents, could be zero
  cost = rand(200) - 20
  cost = 0 if cost < 0

  logline = "#{timestamp},#{user_id},#{resource_id},#{zone_id},#{cost}"
  #puts logline
  logline
end

time_inc = (24.0*3600)/entries
#puts "time inc : #{time_inc}"




threads = []

0.upto(days-1) do |day|

  threads << Thread.new(day) do |myday|
    start_ts = Time.local(2010, 1, 1) + myday * 24 * 3600
    end_ts = Time.local(2010, 1, 1 , 23, 59, 59) + myday * 24 * 3600
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
