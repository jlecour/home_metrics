require 'sinatra'
require 'time'
require './lib/metric'

STORE = {}

get '/' do
  erb :new
end

post '/' do
  @metric = Metric.new(
    params['metric']['datetime'],
    params['metric']['kind'],
    params['metric']['value']
  )
  
  STORE[@metric.id] = @metric.to_hash
  
end