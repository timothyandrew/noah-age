require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'jekyll-timeago'

configure { set :server, :puma }
set :port, 9494

BIRTH = DateTime.parse('2017-10-12T12:06:00+05:30')

def since_birth
  Jekyll::Timeago::Core.timeago(BIRTH, DateTime.now, depth: 4)
end

get '/' do
  "Noah Andrew was born #{since_birth}."
end
