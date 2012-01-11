require 'sinatra'
require 'time'
require './lib/metric'

STORE = {}

get '/' do
  redirect to('/metrics/new')
end

get '/metrics/new' do
  erb :new
end

post '/metrics' do
  @metric = Metric.new(
    params['metric']['datetime'],
    params['metric']['kind'],
    params['metric']['value']
  )
  logger.info "Received #{params.inspect}"
  
  STORE[@metric.id] = @metric.to_hash
  logger.info "Stored #{@metric.id}: #{@metric.to_hash}"
  
  @metric.to_hash.inspect
end

get '/metrics' do
  STORE.inspect
end

get '/metrics/:id' do
  if params[:id] && STORE.has_key?(params[:id])
    STORE[params[:id]][:date].inspect
  else
    raise Sinatra::NotFound
  end
end