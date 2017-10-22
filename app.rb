require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'jekyll-timeago'

configure { set :server, :puma }
set :bind, '127.0.0.1'
set :port, 9494

BIRTH = DateTime.parse('2017-10-12T12:06:00+05:30')

def since_birth
  Jekyll::Timeago::Core.timeago(BIRTH, DateTime.now, depth: 4)
end

def summary
  base = DateTime.now - BIRTH
  days = base.to_i
  hours = (base * 24).to_i
  minutes = (base * 24 * 60).to_i
  seconds = (base * 24 * 60 * 60).to_i

  "Noah has been around for ...
   #{days} days
   #{hours} hours
   #{minutes} minutes
   #{seconds} seconds"
end

get '/' do
  "Noah Andrew was born #{since_birth}.\n\n#{summary}"
end
