require 'rubygems'
require 'sinatra'
require 'dm-sqlite-adapter'
require 'dm-migrations'
require 'time'
require './lib/metric'

DataMapper.setup(:default, {
  :adapter  => 'sqlite3',
  :host     => 'localhost',
  :username => '',
  :password => '',
  :database => "db/#{Sinatra::Application.environment}.sqlite"
})

DataMapper.finalize
DataMapper.auto_upgrade!

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