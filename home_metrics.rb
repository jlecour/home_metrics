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

get '/' do
  redirect to('/metrics/new')
end

get '/metrics/new' do
  erb :new
end

post '/metrics' do
  logger.info "Received #{params.inspect}"

  @metric = Metric.create(
    params['metric']['datetime'],
    params['metric']['kind'],
    params['metric']['value']
  )

  logger.info "Stored #{@metric.inspect}"
  
  @metric.inspect
end

get '/metrics' do
  @metrics = Metric.all
end

get '/metrics/:id' do
  begin
    @metric = Metric.get!(params[:id])
  rescue DataMapper::ObjectNotFoundError
    raise Sinatra::NotFound
  end
end