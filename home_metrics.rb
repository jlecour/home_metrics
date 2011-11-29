require 'sinatra'
require './lib/metric'

STORE = {}

get '/' do
  erb :new
end

post '/' do
  @metric = Metric.new(
    params['metric']['date'],
    params['metric']['kind'],
    params['metric']['value']
  )
  
  STORE[@metric.id] = @metric.to_hash
  
end